# Services Plugin for DocPad

Adds super simple support for the following 3rd party services to DocPad:

- [Disqus](http://disqus.com/)
- [Gauges](http://gaug.es/)
- [Google Analytics](http://www.google.com.au/analytics/)
- [Mixpanel](https://mixpanel.com/)
- [Reinvigorate](https://www.reinvigorate.net/)
- [Zopim](http://zopim.com/)

As well as social buttons for:

- Google Plus One
- Reddit Submit Button
- Hacker News Submitt Button
- Facebook Like
- Facebook Follow
- Twitter Tweet
- Twitter Follow
- Github Follow
- Quora Follow


## Install

### Install the Plugin

```
npm install --save docpad-plugin-services
```

### Add the Script Block for most services

Ensure your layout includes the scripts block. With eco, it will look something like this:

```
<%- @getBlock('scripts').toHTML() %>
```

This is used for the Gauges, Google Analytics, Mixpanel, Reinvigorate, and Zopim services.


### Add Template Helpers for special services

- Disqus: `<%- @getDisqus() %>`
- Social Buttons: `<%- @getSocialButtons() %>`


## Configure

Add the following to your [docpad configuration file](http://bevry.me/docpad/config):

``` coffee
# ...
templateData:
	site:
		url: 'http://my-production-website.com'
		services:
			facebookLikeButton:
				applicationId: '266367676718271'
			facebookFollowButton:
				applicationId: '266367676718271'
				username: 'balupton'
			twitterTweetButton: 'balupton'
			twitterFollowButton: 'balupton'
			githubFollowButton: 'balupton'
			quoraFollowButton: 'Benjamin-Lupton'
			disqus: 'disqus-id'
			gauges: 'gauges-id'
			googleAnalytics: 'googleAnalytics-id'
			mixpanel: 'mixpanel-id'
			reinvigorate: 'reinvigorate-id'
			zopim: 'zopim-id'
# ..
```

If you would also like to disable a service inside the development environment, add the following as well:

``` coffee
# ...
environments:
	development:
		templateData:
			site:
				services:
					serviceToDisable: false
# ...
```


## History
You can discover the history inside the `History.md` file


## License
Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2012+ [Bevry Pty Ltd](http://bevry.me)