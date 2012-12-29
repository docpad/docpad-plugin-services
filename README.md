# Services Plugin for DocPad

Adds super simple support for the following 3rd party services to DocPad:

- [Gauges](http://gaug.es/)
- [Google Analytics](http://www.google.com.au/analytics/)
- [Mixpanel](https://mixpanel.com/)
- [Reinvigorate](https://www.reinvigorate.net/)
- [Zopim](http://zopim.com/)


## Install

1. Install the Plugin

  ```
  npm install --save docpad-plugin-services
  ```

1. Ensure your layout outputs the scripts block, using eco it will look something like this:

  ```
  <%- @getBlock('scripts').toHTML() %>
  ```


## Configure

Add the following to your [docpad configuration file](http://bevry.me/docpad/config):

``` coffee
# ...
templateData:
	site:
		services:
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
<br/>Copyright &copy; 2012 [Bevry Pty Ltd](http://bevry.me)