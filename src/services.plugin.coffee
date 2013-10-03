# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class ServicesPlugin extends BasePlugin
		# Plugin configuration
		name: 'services'

		# =========================
		# Ttemplate Data

		# Template Data Helpers
		templateData:

			# =========================
			# Helpers

			# Get Page Url
			getPageUrl: ->
				pageUrl = (@site.url or '')+@document.url.replace(/\/index.html$/,'').replace(/\/$/,'')
				pageUrl or= '/'  # home pages
				return pageUrl

			# Get Services
			getServices: ->
				services = @site?.services or {}
				return services

			# Get Service Buttons
			getServiceButtons: (services) ->
				# Prepare
				services ?= @getServices()
				result = @getSocialButtons(services) + @getServiceBadges(services)

				# Return
				return """
					<div class="service-buttons">#{result}</div>
					"""

			# Get Social Buttons
			getSocialButtons: (services) ->
				# Prepare
				services ?= @getServices()
				buttons = services.buttons or [
					'GooglePlusOne'
					'RedditSubmit'
					'HackerNewsSubmit'
					'FacebookLike'
					'FacebookFollow'
					'TwitterTweet'
					'TwitterFollow'
					'GithubFollow'
					'GithubStar'
					'QuoraFollow'
				]

				# Handle
				result = ''
				for button in buttons
					buttonAdjusted = button[0].toUpperCase()+button[1...]
					fnName = 'get'+buttonAdjusted+'Button'
					fn = @[fnName]
					if fn?
						result += fn.call(@, services)
					else
						result += button

				# Return
				return """
					<div class="social-buttons">#{result}</div>
					"""

			# Get Service Badges
			getServiceBadges: (services) ->
				# Prepare
				services ?= @getServices()
				buttons = services.buttons or [
					'TravisStatus'
					'Fury'
					'Gittip'
					'Flattr'
					'Paypal'
				]

				# Handle
				result = ''
				for button in buttons
					buttonAdjusted = button[0].toUpperCase()+button[1...]
					fn = @['get'+buttonAdjusted+'Button']
					if fn?
						result += fn.call(@, services)
					else
						result += button

				# Return
				return """
					<div class="service-badges">#{result}</div>
					"""


			# =========================
			# Buttons

			# Get Travis CI Build Status
			getTravisStatusButton: (services) ->
				# Prepare
				services ?= @getServices()
				code = services.travisStatusButton
				return ''  unless code

				# Return
				return """
					<div class="travis-status-button service-button">
						<a href="http://travis-ci.org/bevry/docpad" title="Check this project's build status on TravisCI">
							<img alt="Build status" src="//secure.travis-ci.org/#{code}.png?branch=master" />
						</a>
					</div>
					"""

			# Get Fury Button
			getFuryButton: (services) ->
				# Prepare
				services ?= @getServices()
				code = services.furyButton
				return ''  unless code

				# Return
				return """
					<div class="fury-button service-button">
						<a href="https://npmjs.org/package/#{code}" title="View this project on NPM">
							<img alt="Package version" src="//badge.fury.io/js/#{code}.png" />
						</a>
					</div>
					"""

			# Get Gittip Button
			getGittipButton: (services) ->
				# Prepare
				services ?= @getServices()
				code = services.gittipButton
				return ''  unless code

				# Return
				return """
					<div class="gittip-button service-button">
						<a href="https://www.gittip.com/#{code}/" title="Donate weekly to this project using Gittip">
							<img alt="Gittip donate button" src="//badgr.co/gittip/#{code}.png" />
						</a>
					</div>
					"""

			# Get Flattr Button
			getFlattrButton: (services) ->
				# Prepare
				services ?= @getServices()
				code = services.flattrButton
				return ''  unless code

				# Return
				return """
					<div class="flattr-button service-button">
						<a href="http://flattr.com/thing/#{code}" title="Donate monthly to this project using Flattr">
							<img alt="Flattr donate button" src="//raw.github.com/balupton/flattr-buttons/master/badge-89x18.gif" />
						</a>
					</div>
					"""

			# Get Paypal Button
			getPaypalButton: (services) ->
				# Prepare
				services ?= @getServices()
				code = services.paypalButton
				return ''  unless code

				# Return
				return """
					<div class="paypal-button service-button">
						<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=#{code}" title="Donate once-off to this project using Paypal">
							<img alt="Paypal donate button" src="//www.paypalobjects.com/en_AU/i/btn/btn_donate_SM.gif" />
						</a>
					</div>
					"""

			# Get Google Plus One Button
			getGooglePlusOneButton: (services) ->
				# Prepare
				services ?= @getServices()
				return ''  if services.googlePlusOneButton is false
				pageUrl = @getPageUrl()

				# Return
				return """
					<div class="google-plus-one-button service-button">
						<div class="g-plusone" data-size="medium" data-href="#{escape pageUrl}"></div>
						<script>
							(function() {
								var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
								po.src = 'https://apis.google.com/js/plusone.js';
								var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
							})();
						</script>
					</div>
					"""

			# Get Reddit Submit Button
			getRedditSubmitButton: (services) ->
				# Prepare
				services ?= @getServices()
				return ''  if services.redditSubmitButton is false
				pageUrl = @getPageUrl()

				# Return
				return """
					<div class="reddit-submit-button service-button">
						<script type="text/javascript" src="http://en.reddit.com/static/button/button1.js"></script>
					</div>
					"""

			# Get Hacker News Submit Button
			getHackerNewsSubmitButton: (services) ->
				# Prepare
				services ?= @getServices()
				return ''  if  services.hackerNewsSubmitButton is false
				#pageTitle = (@document.title or @document.name or @site.title)
				pageUrl = @getPageUrl()

				# Return
				return """
					<div class="hacker-news-submit-button service-button">
						<a href="http://news.ycombinator.com/submit" class="hn-share-button" data-url="#{pageUrl}">Vote on HN</a>
						<script>
							(function(d, t) {
								var g = d.createElement(t),
									s = d.getElementsByTagName(t)[0];
									g.src = '//hnbutton.appspot.com/static/hn.min.js';
								s.parentNode.insertBefore(g, s);
							}(document, 'script'));
						</script>
					</div>
					"""

			# Get Facebook Like Button
			getFacebookLikeButton: (services) ->
				# Prepare
				services ?= @getServices()
				facebookApplicationId = services.facebookLikeButton?.applicationId ? '266367676718271'
				return ''  unless facebookApplicationId
				pageUrl = @getPageUrl()

				# Return
				return """
					<div class="facebook-like-button service-button">
						<iframe src="//www.facebook.com/plugins/like.php?href=#{escape pageUrl}&amp;send=false&amp;layout=button_count&amp;width=450&amp;show_faces=false&amp;font&amp;colorscheme=light&amp;action=like&amp;height=21&amp;appId=#{escape facebookApplicationId}" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:21px;" allowTransparency="true"></iframe>
					</div>
					"""

			# Get Facebook Follow Button
			getFacebookFollowButton: (services) ->
				# Prepare
				services ?= @getServices()
				facebookApplicationId = services.facebookFollowButton?.applicationId ? '266367676718271'
				facebookUsername = services.facebookFollowButton?.username
				return ''  unless (facebookUsername and facebookApplicationId)

				# Return
				return """
					<div class="facebook-follow-button service-button">
						<iframe src="//www.facebook.com/plugins/follow.php?href=https%3A%2F%2Fwww.facebook.com%2F#{escape facebookUsername}&amp;layout=button_count&amp;show_faces=false&amp;colorscheme=light&amp;font&amp;width=450&amp;appId=#{escape facebookApplicationId}" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height: 20px;" allowTransparency="true"></iframe>
					</div>
					"""


			# Get Twitter Tweet Button
			getTwitterTweetButton: (services) ->
				# Prepare
				services ?= @getServices()
				twitterUsername = services.twitterTweetButton
				return ''  unless twitterUsername

				# Return
				return """
					<div class="twitter-tweet-button service-button">
						<a href="https://twitter.com/share" class="twitter-share-button" data-via="#{twitterUsername}" data-related="#{twitterUsername}">Tweet</a>
						<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
					</div>
					"""

			# Get Twitter Follow Button
			getTwitterFollowButton: (services) ->
				# Prepare
				services ?= @getServices()
				twitterUsername = services.twitterFollowButton
				return ''  unless twitterUsername

				# Return
				return """
					<div class="twitter-follow-button service-button">
						<a href="https://twitter.com/#{twitterUsername}" class="twitter-follow-button" data-show-count="false">Follow @#{twitterUsername}</a>
						<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
					</div>
					"""

			# Get Github Follow Button
			getGithubFollowButton: (services) ->
				# Prepare
				services ?= @getServices()
				githubUsername = services.githubFollowButton
				return ''  unless githubUsername

				# Return
				return """
					<div class="github-follow-button service-button">
						<iframe src="//ghbtns.com/github-btn.html?user=#{githubUsername}&amp;type=follow&amp;count=true" allowtransparency="true" frameborder="0" scrolling="0" width="165" height="20"></iframe>
					</div>
					"""

			# Get GitHub Star Button
			getGithubStarButton: (services) ->
				# Prepare
				services ?= @getServices()
				parts = services.githubStarButton?.split('/')
				return ''  unless parts?.length is 2 and parts[0] and parts[1]
				githubUsername = parts[0]
				githubRepo = parts[1]

				# Return
				return """
					<div class="github-star-button service-button">
						<iframe src="//ghbtns.com/github-btn.html?user=#{githubUsername}&amp;repo=#{githubRepo}&amp;type=watch&amp;count=true" allowtransparency="true" frameborder="0" scrolling="0" width="110" height="20"></iframe>
					</div>
					"""

			# Get Quora Follow Button
			getQuoraFollowButton: (services) ->
				# Prepare
				services ?= @getServices()
				quoraUsername = services.quoraFollowButton ? ''
				return ''  unless quoraUsername
				quoraRealname = quoraUsername.replace(/-/g,' ')
				quoraCode = '7N31XJs'

				# Return
				return """
					<div class="quora-follow-button service-button">
						<span class="quora-follow-button" data-name="#{quoraUsername}">
							Follow <a href="http://www.quora.com/#{quoraUsername}">#{quoraRealname}</a> on <a href="http://www.quora.com">Quora</a>
							<script type="text/javascript" src="//www.quora.com/widgets/follow?embed_code=#{quoraCode}"></script>
						</span>
					</div>
					"""


			# =========================
			# Services

			# Disqus
			getDisqus: (services) ->
				# Prepare
				services ?= @getServices()
				disqusShortname = services.disqus
				return ''  unless disqusShortname
				disqusDeveloper = if 'production' in @getEnvironments() then '0' else '1'
				pageUrl = @getPageUrl()
				disqusIdentifier = @document.slug
				disqusTitle = @document.title or @document.name

				# Return
				return """
					<div id="disqus_thread"></div>
					<script>
						(function(){
							window.disqus_shortname = '#{disqusShortname}';
							window.disqus_developer = '#{disqusDeveloper}';
							window.disqus_url = '#{pageUrl}';
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
			getGauges: (services) ->
				# Prepare
				services ?= @getServices()
				gaugesSiteId = services.gauges
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
			getGoogleAnalytics: (services) ->
				# Prepare
				services ?= @getServices()
				googleAccountId = services.googleAnalytics
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
			getMixpanel: (services) ->
				# Prepare
				services ?= @getServices()
				mixpanelId = services.mixpanel
				return ''  unless mixpanelId

				# Return
				return """
					(function(c,a){window.mixpanel=a;var b,d,h,e;b=c.createElement("script");b.type="text/javascript";b.async=!0;b.src=("https:"===c.location.protocol?"https:":"http:")+'//cdn.mxpnl.com/libs/mixpanel-2.2.min.js';d=c.getElementsByTagName("script")[0];d.parentNode.insertBefore(b,d);a._i=[];a.init=function(b,c,f){function d(a,b){var c=b.split(".");2==c.length&&(a=a[c[0]],b=c[1]);a[b]=function(){a.push([b].concat(Array.prototype.slice.call(arguments,0)))}}var g=a;"undefined"!==typeof f?g=a[f]=[]:f="mixpanel";g.people=g.people||[];h=['disable','track','track_pageview','track_links','track_forms','register','register_once','unregister','identify','alias','name_tag','set_config','people.set','people.increment'];for(e=0;e<h.length;e++)d(g,h[e]);a._i.push([b,c,f])};a.__SV=1.2;})(document,window.mixpanel||[]);mixpanel.init("#{mixpanelId}");
					"""

			# Reinvigorate
			getReinvigorate: (services) ->
				# Prepare
				services ?= @getServices()
				reinvigorateId = services.reinvigorate
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
			getZopim: (services) ->
				# Prepare
				services ?= @getServices()
				zopimId = services.zopim
				return ''  unless zopimId

				# Return
				return """
					window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set._.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute('charset','utf-8');$.src='//cdn.zopim.com/?#{zopimId}';z.t=+new Date;$.type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script');
					"""

			# Inspectlet
			getInspectlet: (services) ->
				# Prepare
				services ?= @getServices()
				inspectlit = services.inspectlit
				return ''  unless inspectlit

				# Return
				return """
					<!-- Begin Inspectlet Embed Code -->
					<script id="inspectletjs">
						window.__insp = window.__insp || [];
						__insp.push(['wid', #{inspectlit}]);
						(function() {
							function __ldinsp(){var insp = document.createElement('script'); insp.type = 'text/javascript'; insp.async = true; insp.id = "inspsync"; insp.src = ('https:' == document.location.protocol ? 'https' : 'http') + '://www.inspectlet.com/inspectlet.js'; var x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(insp, x); }
							if (window.attachEvent){
								window.attachEvent('onload', __ldinsp);
							}else{
								window.addEventListener('load', __ldinsp, false);
							}
						})();
					</script>
					<!-- End Inspectlet Embed Code -->
					"""

		# =========================
		# Events

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
			serviceScripts = ['Gauges','GoogleAnalytics','Mixpanel','Reinvigorate','Zopim','Inspectlet']
			for serviceScript in serviceScripts
				serviceScriptContent = templateData['get'+serviceScript].call(templateData)
				scripts.push(serviceScriptContent)  if serviceScriptContent

			# Script
			scriptsBlock.add(scripts,{
				defer: false
			})

			# Chain
			@
