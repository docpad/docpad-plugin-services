## History

- v2.4.6 October 31, 2013
	- Use shields.io for flattr as well

- v2.4.5 October 31, 2013
	- Use shields.io for badges

- v2.4.4 October 5, 2013
	- Fixed inspectlet error for everyone not using it (regression from v2.3.0)

- v2.4.3 October 4, 2013
	- Fixed inspectlet service (regression from v2.3.0)

- v2.4.2 September 30, 2013
	- Fixed inspectlet service (regression from v2.3.0)

- v2.4.1 September 30, 2013
	- Fixed github star error (regression from v2.4.0)

- v2.4.0 September 30, 2013
	- Added buttons:
		- Github Star

- v2.3.0 September 17, 2013
	- Renamed social buttons to service buttons
		- `getSocialButtons` to `getServiceButtons`
		- `social-button` to `service-button`
	- Most of the template helpers now can have the services object swapped out by passing it as the first object
	- Added services:
		- Inspectlet
	- Added buttons:
		- Travis Status Button
		- Fury Button
		- Gittip Button
		- Flattr Button
		- Paypal Button

- v2.2.6 May 30, 2013
	- Can now disable the facebook buttons by setting their `applicationId` property to `false`

- v2.2.5 May 30, 2013
	- Fix facebook like button on home page
	- Mild performance improvement
	- Updated for latest DocPad conventions

- v2.2.4 March 15, 2013
	- Added the ability to specify which social buttons you want outputted on the `getSocialButtons` method

- v2.2.3 March 7, 2013
	- Repackaged

- v2.2.2 February 11, 2013
	- Like/submit urls are now clean
	- Added buttons:
		- Reddit Submit
		- Hacker News Submit

- v2.2.1 February 10, 2013
	- Fixed break when Quora follow button is not configured

- v2.2.0 February 10, 2013
	- Added buttons:
		- Google Plus One
		- Facebook Like
		- Facebook Follow
		- Twitter Tweet
		- Twitter Follow
		- Github Follow
		- Quora Follow

- v2.1.0 February 3, 2013
	- Added support for [Disqus](http://disqus.com/) via `@getDisqus()` template helper
	- Added template helpers for all supported services
	- Fixed reinvigorate service not injecting when socket.io is used

- v2.0.0 December 29, 2012
	- Initital working release