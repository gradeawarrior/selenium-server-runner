CWD = $(shell pwd)
SELENIUM_SERVER = http://localhost:4444
BROWSER_TYPE = firefox
# FIREFOX_WEBDRIVER_VERSION ?= 0.14.0
FIREFOX_WEBDRIVER_VERSION ?= 0.16.1
CHROME_WEBDRIVER_VERSION ?= 2.27
PHANTOMJS_VERSION ?= 2.1.1

export PATH := $(PATH):$(CWD)/bin:$(CWD)/bin/phantomjs-$(PHANTOMJS_VERSION)-macosx/bin
$(info PATH=$(PATH))

default:
	$(info ******************)
	$(info Welcome to selenium-server-runner)
	$(info You can run 'make list' to see a list of targets)
	$(info Please see the README.md for instructions.)
	$(info ******************)

install.dependencies: clean
	$(info ******************)
	$(info install.dependencies)
	$(info ******************)
	cd bin; curl -L https://github.com/mozilla/geckodriver/releases/download/v$(FIREFOX_WEBDRIVER_VERSION)/geckodriver-v$(FIREFOX_WEBDRIVER_VERSION)-macos.tar.gz > geckodriver-v$(FIREFOX_WEBDRIVER_VERSION)-macos.tar.gz
	cd bin; curl -L https://chromedriver.storage.googleapis.com/$(CHROME_WEBDRIVER_VERSION)/chromedriver_mac64.zip > chromedriver_mac64_$(CHROME_WEBDRIVER_VERSION).zip
	cd bin; curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$(PHANTOMJS_VERSION)-macosx.zip > phantomjs-$(PHANTOMJS_VERSION)-macosx.zip
	cd bin; tar -xvzf geckodriver-v$(FIREFOX_WEBDRIVER_VERSION)-macos.tar.gz
	cd bin; unzip chromedriver_mac64_$(CHROME_WEBDRIVER_VERSION).zip
	cd bin; unzip phantomjs-$(PHANTOMJS_VERSION)-macosx.zip
	brew install selenium-server-standalone


# ===================================================================
# Selenium Server
# ===================================================================

run: run.selenium

selenium.run: run.selenium

run.selenium:
	selenium-server -port 4444


# ===================================================================
# Makefile utility
# ===================================================================


clean:
	$(info ******************)
	$(info cleaning up dependencies under bin/)
	$(info ******************)
	rm -f bin/geckodriver*
	rm -f bin/chromedriver*
	rm -rf bin/phatomjs*


list:
	@grep '^[^#[:space:]].*:' Makefile
