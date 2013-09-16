# Services Plugin for [DocPad](http://docpad.org)

[![Build Status](https://secure.travis-ci.org/docpad/docpad-plugin-services.png?branch=master)](http://travis-ci.org/docpad/docpad-plugin-services "Check this project's build status on TravisCI")
[![NPM version](https://badge.fury.io/js/docpad-plugin-services.png)](https://npmjs.org/package/docpad-plugin-services "View this project on NPM")
[![Flattr donate button](https://raw.github.com/balupton/flattr-buttons/master/badge-89x18.gif)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://www.paypalobjects.com/en_AU/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")

Adds super simple support to DocPad for many 3rd part services, buttons and badges.


## Supports

These 3rd party services:

- [Disqus](http://disqus.com/)
- [Gauges](http://gaug.es/)
- [Google Analytics](http://www.google.com.au/analytics/)
- [Inspectlet](http://www.inspectlet.com/)
- [Mixpanel](https://mixpanel.com/)
- [Reinvigorate](https://www.reinvigorate.net/)
- [Zopim](http://zopim.com/)

These social buttons:

- Google Plus One
- Reddit Submit
- Hacker News Submit
- Facebook Like
- Facebook Follow
- Twitter Tweet
- Twitter Follow
- Github Follow
- Quora Follow

These service badges:

- Travis CI
- Fury.io
- Gittip
- Flattr
- Paypal


## Install

### Install the Plugin

```
docpad install services
```

### Add the Script Block for most services

Ensure your layout includes the scripts block. With eco, it will look something like this:

```
<%- @getBlock('scripts').toHTML() %>
```

This is used for the Gauges, Google Analytics, Mixpanel, Reinvigorate, and Zopim services.


### Add Template Helpers for special services

- Disqus: `<%- @getDisqus() %>`
- Service Buttons: `<%- @getServiceButtons() %>`


## Configure

Add the following to your [docpad configuration file](http://bevry.me/docpad/config):

``` coffee
# ...
templateData:
	site:
		url: 'http://my-production-website.com'
		services:
			buttons: ['FacebookLike']  # used to customise the order of the buttons

			facebookLikeButton:
				applicationId: '266367676718271'
			facebookFollowButton:
				applicationId: '266367676718271'
				username: 'balupton'
			twitterTweetButton: 'balupton'
			twitterFollowButton: 'balupton'
			githubFollowButton: 'balupton'
			quoraFollowButton: 'Benjamin-Lupton'
			travisStatusButton: 'bevry/docpad'
			furyButton: 'docpad'
			gittipButton: 'docpad'
			flattrButton: '344188/balupton-on-Flattr'
			paypalButton: 'QB8GQPZAH84N6'  # paypal button email id
			
			disqus: 'disqus-id'
			gauges: 'gauges-id'
			googleAnalytics: 'googleAnalytics-id'
			inspectlet: 'inspectlet-id'
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