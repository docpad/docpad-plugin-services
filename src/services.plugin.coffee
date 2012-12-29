# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class ServicesPlugin extends BasePlugin
		# Plugin configuration
		name: 'services'

		# Populate Collections
		# Used to inject our scripts block
		populateCollections: (opts) ->
			# Prepare
			docpad = @docpad
			config = @config
			templateData = docpad.getTemplateData()
			scriptsBlock = docpad.getBlock('scripts')
			scripts = []

			# Gauges
			gaugesSiteId = templateData.site?.services?.gauges
			if gaugesSiteId then scripts.push """
				var _gauges = _gauges || [];
				(function() {
					var t   = document.createElement('script');
					t.type  = 'text/javascript';
					t.async = true;
					t.id    = 'gauges-tracker';
					t.setAttribute('data-site-id', '#{gaugesSiteId}');
					t.src = '//secure.gaug.es/track.js';
					var s = document.getElementsByTagName('script')[0];
					s.parentNode.insertBefore(t, s);
				})();
				"""

			# Google Analytics
			googleAccountId = templateData.site?.services?.googleAnalytics
			if googleAccountId then scripts.push """
				var _gaq = _gaq || [];
				_gaq.push(['_setAccount', '#{googleAccountId}']);
				_gaq.push(['_trackPageview']);
				(function() {
					var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
					ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
					var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
				})();
				"""

			# Mixpanel
			mixpanelId = templateData.site?.services?.mixpanel
			if mixpanelId then scripts.push """
				(function(c,a){window.mixpanel=a;var b,d,h,e;b=c.createElement("script");b.type="text/javascript";b.async=!0;b.src=("https:"===c.location.protocol?"https:":"http:")+'//cdn.mxpnl.com/libs/mixpanel-2.2.min.js';d=c.getElementsByTagName("script")[0];d.parentNode.insertBefore(b,d);a._i=[];a.init=function(b,c,f){function d(a,b){var c=b.split(".");2==c.length&&(a=a[c[0]],b=c[1]);a[b]=function(){a.push([b].concat(Array.prototype.slice.call(arguments,0)))}}var g=a;"undefined"!==typeof f?g=a[f]=[]:f="mixpanel";g.people=g.people||[];h=['disable','track','track_pageview','track_links','track_forms','register','register_once','unregister','identify','alias','name_tag','set_config','people.set','people.increment'];for(e=0;e<h.length;e++)d(g,h[e]);a._i.push([b,c,f])};a.__SV=1.2;})(document,window.mixpanel||[]);mixpanel.init("#{mixpanelId}");
				"""

			# Reinvigorate
			reinvigorateId = templateData.site?.services?.reinvigorate
			if reinvigorateId then scripts.push """
				// Add the depedency if it doesn't already exist
				if ( typeof io === 'undefined' ) {
					var t = document.createElement('script');
					t.type = 'text/javascript';
					t.async = true;
					t.src = '//include.reinvigorate.net/re_.js';
					t.onload = function(){
						reinvigorate.track("#{reinvigorateId}");
					};
					var s = document.getElementsByTagName('script')[0];
					s.parentNode.insertBefore(t,s);
				}
				"""

			# Zopim
			zopimId = templateData.site?.services?.zopim
			if zopimId then scripts.push """
				window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set._.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute('charset','utf-8');$.src='//cdn.zopim.com/?#{zopimId}';z.t=+new Date;$.type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script');
				"""

			# Script
			scriptsBlock.add(scripts,{
				defer: false
			})

			# Chain
			@
