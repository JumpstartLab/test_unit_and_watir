# Introducing Watir

Watir, short for "Web Application Testing in Ruby", is a library for driving a web browser from Ruby. It has a very small API for loading pages, interacting with form elements, and querying for content.

The base Watir library is written for Internet Explorer on Windows. We'll instead use Watir-Webdriver which can use Firefox, Chrome, or Safari and runs on Windows, Mac OS, and Linux.

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
browser.goto 'http://jumpstartlab.com'
```

A Firefox window should be opened and it'll attempt to connect to Google, even if you don't have internet access.

## Commands

Let's take a look at the commands available with the Watir browser.

### Reference

The best reference for using Watir is the Watir-Webdriver API documentation here: http://rubydoc.info/gems/watir-webdriver

In particular you'll call a lot of methods on an instance of the `Browser` class: http://rubydoc.info/gems/watir-webdriver/0.3.2/Watir/Browser

### Loading and Closing Pages

Use `browser.goto(address)` to load a page where `address` is the full URL you want to load.

Use `browser.close` to close the window.

### Finding Elements

Once you have a page loaded you'll want to interact with the contents and elements.

You can search the page for HTML elements using methods like these:

```ruby
browser.link(:href, '/courses/ruby')
browser.div(:id, 'content')
```

The selector doesn't actually match the content until you try to interact with it. One way to do that is with the `exists?` method:

```irb
> browser.link(:href, '/courses/ruby').exists?
=> true 
```

#### Element Contents

Once you find an element you often want to check out its contents.

The `.html` method will return the HTML of the selected element. For example:

```irb
> browser.link(:id, "training-banner").html
 => "<a style=\"\" id=\"training-banner\" href=\"/custom\"><big>Custom Training</big> <em>for</em> <big>Your Team</big></a>"
```

If you just want the visible text contents of the element, then the `.text` method fits the bill:

```irb
> browser.link(:id, "training-banner").text
 => "Custom Training for Your Team"
```

The element's HTML and any HTML tags inside the element are stripped away. This is ideal if you're checking the content of an element and don't need to detect details like span tags or other formatting.

#### Scoping

Frequently you will want to select elements within elements. You can chain the element methods to achieve a scoped search like this:

```irb
> browser.div(:id, "footer").link(:href, 'http://twitter.com/jumpstartlab').text
 => "@JumpstartLab"
```

Here the link will only be matched inside the `'footer'` div. If we try altering it to the `'header'` div there will be no match:

```irb
 > browser.div(:id, "header").link(:href, 'http://twitter.com/jumpstartlab').text
Watir::Exception::UnknownObjectException: unable to locate element, using {:tag_name=>"a", :href=>"http://twitter.com/jumpstartlab"}
```

### Links

Links deserve some special attention.

### Finding Links

You can find a link by CSS `id` or `class` just like other elements, but you can also search for a match based on the HREF attribute:

```ruby
 > browser.link(:href, '/courses/ruby')
 => #<Watir::Anchor:0x10fe34cb0 located=false selector={:tag_name=>"a", :href=>"/courses/ruby"}> 
 > browser.link(:href, '/courses/ruby').text
 => "Ruby" 
```

Note that the href has to match the actual page source. With the same page loaded:

```ruby
 > browser.link(:href, 'http://jumpstartlab.com/courses/ruby')
 => #<Watir::Anchor:0x10fe14b18 located=false selector={:tag_name=>"a", :href=>"http://jumpstartlab.com/courses/ruby"}> 
 > browser.link(:href, 'http://jumpstartlab.com/courses/ruby').text
Watir::Exception::UnknownObjectException: unable to locate element, using {:tag_name=>"a", :href=>"http://jumpstartlab.com/courses/ruby"}
```

The element was not found because the HTML source does not use the full protocol and domain in the link.

### Clicking Links

Clicking a link is simple, find the link element then call `.click` like this:

```ruby
browser.link(:href, '/courses/ruby').click
```

### Forms

You can use Watir to interact with forms, enter content, and submit data.

Find a text field element with `text_field` and change the contents with `set`:

```irb
> browser.text_field(:name, 'EMAIL').set("sample@sample.com")
=> "" 
```

Find other form elements with the methods `.textarea`, `.radio`, `.checkbox`, `.select`, and `.button`.

Submit a form by either selecting the `.button` and calling `.click` or selecting the `.form` and calling `.submit`.

### Matching Groups

Most of the elements can be matched by group. For instance:

```irb
 > browser.links
 => #<Watir::AnchorCollection:0x10fb6a930 @parent=#<Watir::Browser:0x10fa91a68 url="http://jumpstartlab.com/" title="The Best Ruby on Rails Training - Jumpstart Lab">, @selector={:tag_name=>"a"}> 
 > browser.links.count
 => 18 
 > browser.div(:id, 'footer').links
 => #<Watir::AnchorCollection:0x10fb52b28 @parent=#<Watir::Div:0x10fb52c18 located=false selector={:tag_name=>"div", :id=>"footer"}>, @selector={:tag_name=>"a"}> 
 > browser.div(:id, 'footer').links.count
 => 2 
```

Some of the other plural methods include `divs`, `spans`, `checkboxes`, `lis` and so on. If there's a singular, just pluralize the selector to find multiple matches.

When you load a collection of elements the resulting object implements `Enumerable`, so you can use methods like `each`, `collect`, `include?` and so on. See the full `Enumerable` API: http://www.ruby-doc.org/core/classes/Enumerable.html

### Browser Attributes & Manipulation

Check the current URL with `.url`:

```irb
> browser.url
=> "http://jumpstartlab.com/"
```

Check the current window title with `.title`:

```irb
> browser.title
=> "The Best Ruby on Rails Training - Jumpstart Lab"
```

Move back and forward through the history:

```ruby
> browser.back
=> "" 
> browser.forward
=> "" 
```

Reload the current page with `.refresh`:

```irb
> browser.refresh
 => [] 
```
