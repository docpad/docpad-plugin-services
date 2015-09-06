
<!-- TITLE/ -->

# Services Plugin for [DocPad](http://docpad.org)

<!-- /TITLE -->


<!-- BADGES/ -->

[![Build Status](https://img.shields.io/travis/docpad/docpad-plugin-services/master.svg)](http://travis-ci.org/docpad/docpad-plugin-services "Check this project's build status on TravisCI")
[![NPM version](https://img.shields.io/npm/v/docpad-plugin-services.svg)](https://npmjs.org/package/docpad-plugin-services "View this project on NPM")
[![NPM downloads](https://img.shields.io/npm/dm/docpad-plugin-services.svg)](https://npmjs.org/package/docpad-plugin-services "View this project on NPM")
[![Dependency Status](https://img.shields.io/david/docpad/docpad-plugin-services.svg)](https://david-dm.org/docpad/docpad-plugin-services)
[![Dev Dependency Status](https://img.shields.io/david/dev/docpad/docpad-plugin-services.svg)](https://david-dm.org/docpad/docpad-plugin-services#info=devDependencies)<br/>
[![Gratipay donate button](https://img.shields.io/gratipay/docpad.svg)](https://www.gratipay.com/docpad/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPal donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

<!-- /BADGES -->


Adds super simple support to DocPad for many 3rd party services, buttons and badges.


## Supports

These 3rd party services:

- [Disqus](http://disqus.com/)
- [Gauges](http://gaug.es/)
- [Google Analytics](http://www.google.com.au/analytics/)
	- NOTE: v2.5.0 of this plugin and after are for the new [Google Universal Analytics API](https://developers.google.com/analytics/devguides/collection/upgrade/), if you have not yet upgraded, then you will want to use v2.4 of this plugin or earlier.
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
[Discover the change history by heading on over to the `HISTORY.md` file.](https://github.com/docpad/docpad-plugin-services/blob/master/HISTORY.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/docpad/docpad-plugin-services/blob/master/CONTRIBUTING.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- Benjamin Lupton <b@lupton.cc> (https://github.com/balupton)

### Sponsors

No sponsors yet! Will you be the first?

[![Gratipay donate button](https://img.shields.io/gratipay/docpad.svg)](https://www.gratipay.com/docpad/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPal donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

### Contributors

These amazing people have contributed code to this project:

- [Benjamin Lupton](https://github.com/balupton) <b@lupton.cc> — [view contributions](https://github.com/docpad/docpad-plugin-services/commits?author=balupton)
- [RobLoach](https://github.com/RobLoach) — [view contributions](https://github.com/docpad/docpad-plugin-services/commits?author=RobLoach)
- [troykershaw](https://github.com/troykershaw) — [view contributions](https://github.com/docpad/docpad-plugin-services/commits?author=troykershaw)
- [Zearin](https://github.com/Zearin) — [view contributions](https://github.com/docpad/docpad-plugin-services/commits?author=Zearin)

[Become a contributor!](https://github.com/docpad/docpad-plugin-services/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

Copyright &copy; 2012+ Bevry Pty Ltd <us@bevry.me> (http://bevry.me)

<!-- /LICENSE -->


