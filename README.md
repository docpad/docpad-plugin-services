<!-- TITLE/ -->

<h1>Services Plugin for DocPad</h1>

<!-- /TITLE -->


<!-- BADGES/ -->

<span class="badge-travisci"><a href="http://travis-ci.com/docpad/docpad-plugin-services" title="Check this project's build status on TravisCI"><img src="https://img.shields.io/travis/com/docpad/docpad-plugin-services/master.svg" alt="Travis CI Build Status" /></a></span>
<span class="badge-npmversion"><a href="https://npmjs.org/package/docpad-plugin-services" title="View this project on NPM"><img src="https://img.shields.io/npm/v/docpad-plugin-services.svg" alt="NPM version" /></a></span>
<span class="badge-npmdownloads"><a href="https://npmjs.org/package/docpad-plugin-services" title="View this project on NPM"><img src="https://img.shields.io/npm/dm/docpad-plugin-services.svg" alt="NPM downloads" /></a></span>
<span class="badge-daviddm"><a href="https://david-dm.org/docpad/docpad-plugin-services" title="View the status of this project's dependencies on DavidDM"><img src="https://img.shields.io/david/docpad/docpad-plugin-services.svg" alt="Dependency Status" /></a></span>
<span class="badge-daviddmdev"><a href="https://david-dm.org/docpad/docpad-plugin-services#info=devDependencies" title="View the status of this project's development dependencies on DavidDM"><img src="https://img.shields.io/david/dev/docpad/docpad-plugin-services.svg" alt="Dev Dependency Status" /></a></span>
<br class="badge-separator" />
<span class="badge-githubsponsors"><a href="https://github.com/sponsors/balupton" title="Donate to this project using GitHub Sponsors"><img src="https://img.shields.io/badge/github-donate-yellow.svg" alt="GitHub Sponsors donate button" /></a></span>
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-liberapay"><a href="https://liberapay.com/bevry" title="Donate to this project using Liberapay"><img src="https://img.shields.io/badge/liberapay-donate-yellow.svg" alt="Liberapay donate button" /></a></span>
<span class="badge-buymeacoffee"><a href="https://buymeacoffee.com/balupton" title="Donate to this project using Buy Me A Coffee"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg" alt="Buy Me A Coffee donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-crypto"><a href="https://bevry.me/crypto" title="Donate to this project using Cryptocurrency"><img src="https://img.shields.io/badge/crypto-donate-yellow.svg" alt="crypto donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>

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

Add the following to your [docpad configuration file](http://docpad.org/docs/config/):

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
			githubStarButton: 'docpad/docpad'
			quoraFollowButton: 'Benjamin-Lupton'
			travisStatusButton: 'docpad/docpad'
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

<h2>History</h2>

<a href="https://github.com/docpad/docpad-plugin-services/blob/master/HISTORY.md#files">Discover the release history by heading on over to the <code>HISTORY.md</code> file.</a>

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

<h2>Contribute</h2>

<a href="https://github.com/docpad/docpad-plugin-services/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

<h2>Backers</h2>

<h3>Maintainers</h3>

These amazing people are maintaining this project:

<ul><li><a href="https://github.com/balupton">Benjamin Lupton</a> — <a href="https://github.com/docpad/docpad-plugin-services/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository docpad/docpad-plugin-services">view contributions</a></li></ul>

<h3>Sponsors</h3>

No sponsors yet! Will you be the first?

<span class="badge-githubsponsors"><a href="https://github.com/sponsors/balupton" title="Donate to this project using GitHub Sponsors"><img src="https://img.shields.io/badge/github-donate-yellow.svg" alt="GitHub Sponsors donate button" /></a></span>
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-liberapay"><a href="https://liberapay.com/bevry" title="Donate to this project using Liberapay"><img src="https://img.shields.io/badge/liberapay-donate-yellow.svg" alt="Liberapay donate button" /></a></span>
<span class="badge-buymeacoffee"><a href="https://buymeacoffee.com/balupton" title="Donate to this project using Buy Me A Coffee"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg" alt="Buy Me A Coffee donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-crypto"><a href="https://bevry.me/crypto" title="Donate to this project using Cryptocurrency"><img src="https://img.shields.io/badge/crypto-donate-yellow.svg" alt="crypto donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>

<h3>Contributors</h3>

These amazing people have contributed code to this project:

<ul><li><a href="https://github.com/balupton">Benjamin Lupton</a> — <a href="https://github.com/docpad/docpad-plugin-services/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository docpad/docpad-plugin-services">view contributions</a></li>
<li><a href="https://github.com/davisonio">Craig Davison</a> — <a href="https://github.com/docpad/docpad-plugin-services/commits?author=davisonio" title="View the GitHub contributions of Craig Davison on repository docpad/docpad-plugin-services">view contributions</a></li>
<li><a href="https://github.com/mikeumus">Michael Duane Mooring</a> — <a href="https://github.com/docpad/docpad-plugin-services/commits?author=mikeumus" title="View the GitHub contributions of Michael Duane Mooring on repository docpad/docpad-plugin-services">view contributions</a></li>
<li><a href="https://github.com/RobLoach">Rob Loach</a> — <a href="https://github.com/docpad/docpad-plugin-services/commits?author=RobLoach" title="View the GitHub contributions of Rob Loach on repository docpad/docpad-plugin-services">view contributions</a></li>
<li><a href="https://github.com/troykershaw">Troy Kershaw</a> — <a href="https://github.com/docpad/docpad-plugin-services/commits?author=troykershaw" title="View the GitHub contributions of Troy Kershaw on repository docpad/docpad-plugin-services">view contributions</a></li>
<li><a href="https://github.com/Zearin">Zearin</a> — <a href="https://github.com/docpad/docpad-plugin-services/commits?author=Zearin" title="View the GitHub contributions of Zearin on repository docpad/docpad-plugin-services">view contributions</a></li>
<li><a href="https://github.com/vsopvsop">vsopvsop</a> — <a href="https://github.com/docpad/docpad-plugin-services/commits?author=vsopvsop" title="View the GitHub contributions of vsopvsop on repository docpad/docpad-plugin-services">view contributions</a></li></ul>

<a href="https://github.com/docpad/docpad-plugin-services/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /BACKERS -->


<!-- LICENSE/ -->

<h2>License</h2>

Unless stated otherwise all works are:

<ul><li>Copyright &copy; 2012+ <a href="http://bevry.me">Bevry Pty Ltd</a></li></ul>

and licensed under:

<ul><li><a href="http://spdx.org/licenses/MIT.html">MIT License</a></li></ul>

<!-- /LICENSE -->
