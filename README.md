
<!-- TITLE/ -->

# Services Plugin for [DocPad](http://docpad.org)

<!-- /TITLE -->


<!-- BADGES/ -->

[![Build Status](http://img.shields.io/travis-ci/docpad/docpad-plugin-services.png?branch=master)](http://travis-ci.org/docpad/docpad-plugin-services "Check this project's build status on TravisCI")
[![NPM version](https://badge.fury.io/js/docpad-plugin-services.png)](https://npmjs.org/package/docpad-plugin-services "View this project on NPM")
[![Gittip donate button](http://img.shields.io/gittip/docpad.png)](https://www.gittip.com/docpad/ "Donate weekly to this project using Gittip")
[![Flattr donate button](https://raw.github.com/balupton/flattr-buttons/master/badge-89x18.gif)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://www.paypalobjects.com/en_AU/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")

<!-- /BADGES -->


Adds super simple support to DocPad for many 3rd party services, buttons and badges.


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
- Github Star
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

This is used for the Gauges, Google Analytics, Google Analytics Universal, Mixpanel, Reinvigorate, and Zopim services.


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
			githubStarButton: 'bevry/docpad'
			quoraFollowButton: 'Benjamin-Lupton'
			travisStatusButton: 'bevry/docpad'
			furyButton: 'docpad'
			gittipButton: 'docpad'
			flattrButton: '344188/balupton-on-Flattr'
			paypalButton: 'QB8GQPZAH84N6'  # paypal button email id

			disqus: 'disqus-id'
			gauges: 'gauges-id'
			googleAnalytics: 'googleAnalytics-id'
			googleAnalyticsUniversal: 'googleAnalyticsUniversal-id'
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


<!-- HISTORY/ -->

## History
[Discover the change history by heading on over to the `History.md` file.](https://github.com/docpad/docpad-plugin-services/blob/master/History.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `Contributing.md` file.](https://github.com/docpad/docpad-plugin-services/blob/master/Contributing.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- Benjamin Lupton <b@lupton.cc> (https://github.com/balupton)

### Sponsors

No sponsors yet! Will you be the first?

[![Gittip donate button](http://img.shields.io/gittip/docpad.png)](https://www.gittip.com/docpad/ "Donate weekly to this project using Gittip")
[![Flattr donate button](https://raw.github.com/balupton/flattr-buttons/master/badge-89x18.gif)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://www.paypalobjects.com/en_AU/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")

### Contributors

These amazing people have contributed code to this project:

- Benjamin Lupton <b@lupton.cc> (https://github.com/balupton) - [view contributions](https://github.com/docpad/docpad-plugin-services/commits?author=balupton)

[Become a contributor!](https://github.com/docpad/docpad-plugin-services/blob/master/Contributing.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

Copyright &copy; 2012+ Bevry Pty Ltd <us@bevry.me> (http://bevry.me)

<!-- /LICENSE -->


