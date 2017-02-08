# Selenium-Server-Runner

This project greatly simplifies the (i) setup, (ii) configuration, and (iii) running of the selenium-server from a Mac. Assuming you have the various browsers installed and this project checked-out, the steps for starting the server are:

	make install.dependencies
	make run.selenium

The following target browsers are supported:


- [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads)
- [Gecko (Firefox) Driver](https://github.com/mozilla/geckodriver/releases)
- [SafariDriver](https://github.com/SeleniumHQ/selenium/wiki/SafariDriver)
- HTMLUnit (Headless)
- [PhantomJS](http://phantomjs.org/download.html) (Headless)

## Prerequesites

This project was developed on a Mac, and therefore several of the Make targets refer to Mac dependencies. For simplicity, these instructions will assume running on a Mac.

### Required

* `bash`
* `make`
* `curl`
* Latest version of Firefox
* Latest version of Chrome
* [Homebrew](http://brew.sh/)

### Optional Installation

* [MacDown](http://macdown.uranusjr.com/) - A free Markdown reader for OSX
* [Safari Webdriver](https://github.com/SeleniumHQ/selenium/wiki/SafariDriver) (Necessary if intending to automate against Safari)

## Getting Started

The Makefile at the top level will help you get everything started and testing. My assumption right now is that all the pre-requisites have been installed.

### Starting all the services

Installing Selenium and Webdriver dependencies:

	make install.dependencies
	
_**NOTE:** These will install the following drivers:_

- [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads)
- [Gecko (Firefox) Driver](https://github.com/mozilla/geckodriver/releases)
- [PhantomJS](http://phantomjs.org/download.html)

_As long as you are using Mac and have the latest Firefox and Chrome installed, then no modifiations will need to be made to the Makefile; installation and starting the Selenium Service should work fine!_
	
Start the selenium server:

	make selenium.run

And now you should have a standalone Selenium Server running on your machine that you can point your tests to!

### What my Selenium tests should look like

For all languages, you are going to want to use the Remote Driver to executing your tests.

#### Java

TODO

#### Python

	from selenium import webdriver
	
	server = "http://localhost:4444/wd/hub"
	
	# Execute against Firefox
	capabilities = webdriver.DesiredCapabilities.FIREFOX
	capabilities['marionette'] = True
	
	# Execute against HTMLUnit
	capabilities = webdriver.DesiredCapabilities.HTMLUNIT
	
	# Execute against HTMLUnit (with Javascript)
	capabilities = webdriver.DesiredCapabilities.HTMLUNITWITHJS
	
	# Execute against PhantomJS
	capabilities = webdriver.DesiredCapabilities.PHANTOMJS
	
	driver = webdriver.Remote(command_executor=server, desired_capabilities=capabilities)

## Notes

* _**WARNING**: There is currently an issue filed against selenium-server-standalone working with HTMLUnit. See [https://sourceforge.net/p/htmlunit/bugs/1846/](https://sourceforge.net/p/htmlunit/bugs/1846/)_

## References

* Selenium
* WebDriver
	* [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads)
	* [Gecko (Firefox) Driver](https://github.com/mozilla/geckodriver/releases)
	* [SafariDriver](https://github.com/SeleniumHQ/selenium/wiki/SafariDriver)
	* HTMLUnit
	* [PhantomJS](http://phantomjs.org/download.html)