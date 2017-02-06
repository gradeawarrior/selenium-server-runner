# Selenium-Server-Runner



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
	
_**NOTE:** These will install both the [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/downloads) and [Gecko (Firefox) Driver](https://github.com/mozilla/geckodriver/releases) for MacOS. As long as you are using Mac and have the latest Firefox and Chrome installed, then no modifiations will need to be made to the Makefile; installation and starting the Selenium Service should work fine!_
	
Start the selenium server:

	make selenium.run

And now you should have a standalone Selenium Server running on your machine that you can point your tests to!

### What my Selenium tests should look like

TODO

## References

* Selenium
* WebDriver
	* [ChromeDriver v2.25](https://sites.google.com/a/chromium.org/chromedriver/downloads)
	* [Gecko (Firefox) Driver v0.11.1](https://github.com/mozilla/geckodriver/releases)
	* [SafariDriver](https://github.com/SeleniumHQ/selenium/wiki/SafariDriver)