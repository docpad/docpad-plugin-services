# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class ServicesPlugin extends BasePlugin
		# Plugin configuration
		name: 'services'

		# Template Data Helpers
		templateData:
			# Disqus
			getDisqus: ->
				# Prepare
				disqusShortname = @site?.services.disqus
				disqusDeveloper = if 'production' in @getEnvironments() then '0' else '1'
				siteUrl = @site?.url
				disqusIdentifier = @document.slug
				disqusTitle = @document.title or @document.name
				return ''  unless disqusShortname

				# Return
				return """
					<div id="disqus_thread"></div>
					<script>
						(function(){
							window.disqus_shortname = '#{disqusShortname}';
							window.disqus_developer = '#{disqusDeveloper}';
							#{
								if siteUrl
									"window.disqus_url = document.location.href.replace(document.location.protocol+'//'+document.location.host, '#{siteUrl}')"
								else
									"window.disqus_url = document.location.href"
							}
							window.disqus_identifier = '#{disqusIdentifier}';
							window.disqus_title = '#{disqusTitle}';
							if ( window.DISQUS ) {
								return DISQUS.reset({
									reload: true,
									config: function () {
										this.page.identifier = window.disqus_identifier;
										this.page.url = window.disqus_url;
										this.page.title = window.disqus_title;
									}
								});
							}
							else {
							  var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
							  dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
							  (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
							}
						})();
					</script>
					<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
					<a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
					"""

			# Gauges
			getGauges: ->
				# Prepare
				gaugesSiteId = @site?.services?.gauges
				return ''  unless gaugesSiteId

				# Return
				return """
					var _gauges = _gauges || [];
					(function(){
						var t = document.createElement('script');
						t.type = 'text/javascript';
						t.async = true;
						t.id = 'gauges-tracker';
						t.setAttribute('data-site-id', '#{gaugesSiteId}');
						t.src = '//secure.gaug.es/track.js';
						var s = document.getElementsByTagName('script')[0];
						s.parentNode.insertBefore(t, s);
					})();
					"""

			# Google Analytics
			getGoogleAnalytics: ->
				# Prepare
				googleAccountId = @site?.services?.googleAnalytics
				return ''  unless googleAccountId

				# Return
				return """
					var _gaq = _gaq || [];
					_gaq.push(['_setAccount', '#{googleAccountId}']);
					_gaq.push(['_trackPageview']);
					(function(){
						var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
						ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
						var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
					})();
					"""

			# Mixpanel
			getMixpanel: ->
				# Prepare
				mixpanelId = @site?.services?.mixpanel
				return ''  unless mixpanelId

				# Return
				return """
					(function(c,a){window.mixpanel=a;var b,d,h,e;b=c.createElement("script");b.type="text/javascript";b.async=!0;b.src=("https:"===c.location.protocol?"https:":"http:")+'//cdn.mxpnl.com/libs/mixpanel-2.2.min.js';d=c.getElementsByTagName("script")[0];d.parentNode.insertBefore(b,d);a._i=[];a.init=function(b,c,f){function d(a,b){var c=b.split(".");2==c.length&&(a=a[c[0]],b=c[1]);a[b]=function(){a.push([b].concat(Array.prototype.slice.call(arguments,0)))}}var g=a;"undefined"!==typeof f?g=a[f]=[]:f="mixpanel";g.people=g.people||[];h=['disable','track','track_pageview','track_links','track_forms','register','register_once','unregister','identify','alias','name_tag','set_config','people.set','people.increment'];for(e=0;e<h.length;e++)d(g,h[e]);a._i.push([b,c,f])};a.__SV=1.2;})(document,window.mixpanel||[]);mixpanel.init("#{mixpanelId}");
					"""

			# Reinvigorate
			getReinvigorate: ->
				# Prepare
				reinvigorateId = @site?.services?.reinvigorate
				return ''  unless reinvigorateId

				# Return
				return """
					(function(){
						var t = document.createElement('script');
						t.type = 'text/javascript';
						t.async = true;
						t.src = '//include.reinvigorate.net/re_.js';
						t.onload = function(){
							reinvigorate.track("#{reinvigorateId}");
						};
						var s = document.getElementsByTagName('script')[0];
						s.parentNode.insertBefore(t,s);
					})();
					"""

			# Zopim
			getZopim: ->
				# Prepare
				zopimId = @site?.services?.zopim
				return ''  unless zopimId

				# Return
				return """
					window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set._.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute('charset','utf-8');$.src='//cdn.zopim.com/?#{zopimId}';z.t=+new Date;$.type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script');
					"""

		# Extend Template Data
		extendTemplateData: (opts) ->
			# Prepare
			{templateData} = opts

			# Inject template helpers into template data
			for own templateHelperName, templateHelper of @templateData
				templateData[templateHelperName] = templateHelper

			# Chain
			@

		# Populate Collections
		# Used to inject our scripts block
		populateCollections: (opts) ->
			# Prepare
			docpad = @docpad
			config = @config
			templateData = docpad.getTemplateData()
			scriptsBlock = docpad.getBlock('scripts')
			scripts = []

			# Service Scripts
			serviceScripts = ['Gauges','GoogleAnalytics','Mixpanel','Reinvigorate','Zopim']
			for serviceScript in serviceScripts
				serviceScriptContent = @templateData['get'+serviceScript].call(templateData)
				scripts.push(serviceScriptContent)  if serviceScriptContent

			# Script
			scriptsBlock.add(scripts,{
				defer: false
			})

			# Chain
			@
