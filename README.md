oozie-tool
==========

A little toolbox for apache oozie.

This tool will return all FAILED, KILLED and TIMEDOUT actions for all bundles that have the status RUNNING if you run ```bin/oozie-tool bundles```.

It is also possible to only check a specific bundle by the bundle ID with the ```bin/oozie-tool bundle-by-id``` script.

Tested with the following Oozie client build versions:

- 3.1.3-incubating
- 3.3.2-cdh4.7.0

examples
----
Checking a bundle that has no failed, killed and timedout coordinator actions:

![](https://raw.githubusercontent.com/alexanderfahlke/images/master/github.com/alexanderfahlke/oozie-tool/bundle-with-no-failed-coordinators.png)

Checking a bundle with a lot of failed, killed or timedout coordinator actions:

![](https://raw.githubusercontent.com/alexanderfahlke/images/master/github.com/alexanderfahlke/oozie-tool/bundle-with-failed-coordinators.png)

Setup guide
----

1. Clone this repo: ```git clone https://github.com/alexanderfahlke/oozie-tool.git```
2. copy ```conf/config.ini.tpl``` to ```conf/config.ini```
3. adjust ```conf/config.ini``` to match your environment (most likely the ```OOZIE_BIN```)
4. run ```bin/oozie-tool bundles```

Additionally you can run ```test/oozie-tool-config``` to check your configuration.
