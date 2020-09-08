# History

## v2.11.0 2020 September 8

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v2.10.0 2020 September 8

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)

## v2.9.0 2020 August 6

-   Updated dependencies, [base files](https://github.com/bevry/base), and [editions](https://editions.bevry.me) using [boundation](https://github.com/bevry/boundation)
-   Minimum required node version changed from `node: >=0.12` to `node: >=10` to keep up with mandatory ecosystem changes

## v2.8.0 2018 July 11

-   Updated base files using [boundation](https://github.com/bevry/boundation)
-   Compiled with CoffeeScript v2
-   Removed unused `extendr` dependency

## v2.7.0 2017 April 18

-   Updated base files
-   Bumped minimum node version to >=0.12 due to [failed builds on earlier](https://travis-ci.org/docpad/docpad-plugin-services/builds/222830570)

## v2.6.0 2014 May 17

-   Better reddit button that now uses the page url
-   Better hacker news button (new ideal width is `100px`)

## v2.5.0 2013 December 10

-   Use [Google Universal Analytics](https://developers.google.com/analytics/devguides/collection/upgrade/) instead of the now-old ga.js API

## v2.4.6 2013 October 31

-   Use shields.io for flattr as well

## v2.4.5 2013 October 31

-   Use shields.io for badges

## v2.4.4 2013 October 5

-   Fixed inspectlet error for everyone not using it (regression from v2.3.0)

## v2.4.3 2013 October 4

-   Fixed inspectlet service (regression from v2.3.0)

## v2.4.2 2013 September 30

-   Fixed inspectlet service (regression from v2.3.0)

## v2.4.1 2013 September 30

-   Fixed github star error (regression from v2.4.0)

## v2.4.0 2013 September 30

-   Added buttons: - Github Star

## v2.3.0 2013 September 17

-   Renamed social buttons to service buttons - `getSocialButtons` to `getServiceButtons` - `social-button` to `service-button`
-   Most of the template helpers now can have the services object swapped out by passing it as the first object
-   Added services: - Inspectlet
-   Added buttons: - Travis Status Button - Fury Button - Gittip Button - Flattr Button - Paypal Button

## v2.2.6 2013 May 30

-   Can now disable the facebook buttons by setting their `applicationId` property to `false`

## v2.2.5 2013 May 30

-   Fix facebook like button on home page
-   Mild performance improvement
-   Updated for latest DocPad conventions

## v2.2.4 2013 March 15

-   Added the ability to specify which social buttons you want outputted on the `getSocialButtons` method

## v2.2.3 2013 March 7

-   Repackaged

## v2.2.2 2013 February 11

-   Like/submit urls are now clean
-   Added buttons: - Reddit Submit - Hacker News Submit

## v2.2.1 2013 February 10

-   Fixed break when Quora follow button is not configured

## v2.2.0 2013 February 10

-   Added buttons: - Google Plus One - Facebook Like - Facebook Follow - Twitter Tweet - Twitter Follow - Github Follow - Quora Follow

## v2.1.0 2013 February 3

-   Added support for [Disqus](http://disqus.com/) via `@getDisqus()` template helper
-   Added template helpers for all supported services
-   Fixed reinvigorate service not injecting when socket.io is used

## v2.0.0 2012 December 29

-   Initital working release
