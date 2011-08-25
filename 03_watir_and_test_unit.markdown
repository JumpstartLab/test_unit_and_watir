# Watir & Test::Unit

You've written tests with Test::Unit and experimented with using Watir to drive the browser, now it's time to bring them together.

## Revisiting the Basic Frame

Start with the `jumpstartlab_test.rb` file in the `examples` folder.

Notice how we:

* Load `rubygems`, `test/unit`, and `watir-webdriver`
* Override `initialize` to open the browser once before all tests
* Use `setup` to set the starting address for each test
* Use `teardown` to close the browser
* Have a `test_title` method that uses `assert` from `Test::Unit` and `.title` from Watir
* Have a `test_courses` test that verifies that the the courses page includes the word "Perl"

Run this test file with:

```bash
ruby examples/jumpstartlab_test.rb
```

You should see two tests passing and one failing. Correct the failing test by changing `"Perl"` to `"Ruby"`.

## Useful Assertions and Methods

The most useful `Test::Unit` assertions when working with Watir include:

* `assert(boolean,[msg])` : Ensures that the object/expression is true.
* `assert_match(regexp, string, [msg])` : Ensures that a string matches the regular expression.
* `assert_no_match(regexp, string, [msg])` : Ensures that a string doesn’t matches the regular expression.

Particularly when using `assert`, you'll want to make use of these common Ruby methods:

* `include?`: Does the string or collection include the argument?
* `exists?`: Does the matched element exist?
* `downcase`: Useful for converting a string to lowercase before using `include?` to make the test case insensitive

## Practice

Now, let's practice with the sample application!