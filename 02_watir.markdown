# Introducing Watir

Watir, short for "Web Application Testing in Ruby", is a library for driving a web browser from Ruby. It has a very small API for loading pages, interacting with form elements, and querying for content.

The base Watir library is written for Internet Explorer on Windows. We'll instead use FireWatir which uses Firefox and runs on Windows, Mac OS, and Linux.

## Setup

There are a few components that need to be setup before you can get started:

### Browser Setup

Install the Firefox browser from http://getfirefox.com

### Gem Setup

Install the Watir-Webdriver gem at a command prompt:

```
gem install watir-webdriver
```

### Test It Out

Enter the following instructions into an IRB session:

```ruby
require 'rubygems'
require 'watir-webdriver'

browser = Watir::Browser.new
browser.goto 'http://google.com'
```

A Firefox window should be opened and it'll attempt to connect to Google, even if you don't have internet access.

## Commands

Let's take a look at the commands available with the Watir browser.

### Loading and Closing Pages

Use `browser.goto(address)` to load a page where `address` is the full URL you want to load.

Use `browser.close` to close the window.

### Querying

Once you have a page loaded you'll want to interact with the contents and elements.

#### Finding Elements

[TODO: Notes about selectors when I can find some proper documentation]

You can search the page for HTML elements using methods like these:

```ruby
b.link(:href, 'http://google.com')
```

#### Finding Text

[TODO: Notes about selectors when I can find some proper documentation]

#### Window Title

### Clicking
#### Links
#### Buttons