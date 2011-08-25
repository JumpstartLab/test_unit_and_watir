# Introducing Test::Unit

`Test::Unit` is the fundamental testing library built into Ruby. It has a very light syntax but can be used to test systems of any complexity. Most recently, in Ruby 1.9, it has been reimplemented on top of the MiniTest library. But we'll check out Test::Unit as it exists in Ruby 1.8.

## Concepts of Testing

Software testing is a complex art. Let's lay some of the groundwork:

### Approaches to Testing

There are three primary approaches to testing code:

1. Test-After: The code is designed and implemented first, then tests are used to ensure correct functionality.
2. Test-First: The code is designed, then the tests are written, then the code is implemented so the tests pass.
3. Test-Driven: The tests are written first, then the code is designed, then implemented until the tests pass.

In our examples we'll be using the Test-After approach as it best mimics your development process

### Process

In this tutorial we'll work with code that's already expected to work properly. We'll write tests that exercise and validate functionality. So our cycle will be:

1. Write test
2. Run test
3. If test passes, move on. 
4. If it fails either:
  * Correct the test
  * Note the inconsistency/error in the implementation
5. Return to step 1

## Basic Test Outline

One advantage of using the `Test::Unit` framework is that there isn't much to it. We only need a few tools to make things go.

### Setup

The library is part of the Ruby standard library, so the only thing you need to do to use it is require the library:

```ruby
require 'test/unit'
```

Then we can write a collection of tests in a class like this:

```ruby
class TestSample < Test::Unit::TestCase
end
```

The class will inherit from `Test::Unit::TestCase`, so we have access to all the built-in `Test::Unit` assertions and other methods.

### Test Methods

Then within that class we'll write individual methods as our test scenarios:

```ruby
def test_hello

end
```

The things to note are:

* We write normal Ruby instance methods
* The name of the method must start with `test_`

Within the tests we can run any normal Ruby code, create objects, access and manipulate data, then run...

### Assertions

Assertions are the meat of a test. Assertions determine weather the test passes or fails.

The most basic assertion is the `assert` method. For instance:

```ruby
def test_hello
  assert("hello".class == String)
end
```

If the contained expression is true, the test passes. If it's false or raises an exception, the test fails.

#### Beyond `assert`

Though `assert` can be used to test just about anything, there are many other assertions that can be more convenient. For instance, the above example could be rewritten using `assert_instance_of`:

```ruby
def test_hello
  assert_instance_of(String, "hello")
end
```

Experienced Rubyists will leave off the parentheses to get a more sentence-like flow:

```ruby
def test_hello
  assert_instance_of String, "hello"
end
```

#### Other Assertions

Here is a non-exhaustive list of the assertions you'll commonly use:

* `assert(boolean,[msg])` : Ensures that the object/expression is true.
* `assert_equal(obj1, obj2, [msg])` : Ensures that `obj1 == obj2` is true.
* `assert_not_equal(obj1, obj2, [msg])` : Ensures that `obj1 == obj2` is false.
* `assert_in_delta(expecting, actual, delta, [msg])` : Ensures that the numbers expecting and actual are within delta of each other.
* `assert_instance_of(class, obj, [msg])` : Ensures that obj is of the class type.
* `assert_kind_of(class, obj, [msg])` : Ensures that obj is or descends from class.
* `assert_match(regexp, string, [msg])` : Ensures that a string matches the regular expression.
* `assert_no_match(regexp, string, [msg])` : Ensures that a string doesn’t matches the regular expression.
* `assert_nil(obj, [msg])` : Ensures that obj.nil? is true.
* `assert_not_nil(obj, [msg])` : Ensures that obj.nil? is false.
* `assert_raise(except1, except2, ...)  { block }` : Ensures that the given block raises one of the given exceptions.
* `assert_nothing_raised(exception1, ...) { block }` : Ensures that the given block doesn’t raise one of the given exceptions.
* `assert_respond_to(obj, symbol, [msg])` : Ensures that obj has a method called symbol.

### Setup & Teardown

Tests frequently need to setup data at the beginning. Rather than repeating your initialization code in every test we write a `setup` method:

```ruby
class TestSample < Test::Unit::TestCase
  def setup
    @sample_data = "My sample data"
  end
  
  def test_hello
    assert_instance_of String, @sample_data
  end
end
```

The most important thing to note is that the `setup` method is executed *before each test*. So if it does something that takes significant time or computation it'll slow down every test. 

On the other end of the test is the `teardown` method which will be run after each test.

## Practice

Let's put it into practice. We'll use the JSAttend project already developed as our muse.

### Setup

In the same project directory as JSAttend, let's create a folder named `test` and a file within that folder named `jsattend_test.rb`

Open that file and add this frame:

```ruby
require "test/unit"

class JSAttendTest < Test::Unit::TestCase
  def test_truth
    assert(true)
  end
end
```

The `test_truth` method is obviously silly, it's just to check that things are working ok on your system. Open a command prompt window and move to your project directory, then execute the test:

```
ruby test/jsattend_test.rb
```

You should then see this output:

```
Loaded suite test/jsattend_test
Started
.
Finished in 0.000172 seconds.

1 tests, 1 assertions, 0 failures, 0 errors
```

Now you're ready to start testing!

### Exercises

Write tests that exercise the following functionality:

* Ensure that the `clean_phone_number` method:
  * removes periods
  * removes hyphens
  * returns a string made up of only digits when given digits with many symbols
  * returns the invalid phone number marker when given a 12 digit number
  * returns the invalid phone number marker when given a 9 digit number
  * returns the number as-is when given a 10 digit number
  * chops the leading one off an 11 digit number starting with a one
  * returns the invalid phone number marker when give an 11 digit number that starts with something other than a one
  * does not raise an exception with passed `nil` *(Requires new application code)*
  * returns the invalid phone number marker when passed `nil` *(Requires new application code)*
* Ensure that the `clean_zipcode` method:
  * does not change a five digit zipcode
  * pads a four digit input with a leading zero
  * pads a three digit input with a leading zero
  * does not raise an exception with passed `nil`
  * returns the invalid zipcode marker when passed `nil`
* Ensure that the `csv_file` method:
  * Returns a `FasterCSV` instance
  * Starts at the beginning of the file, ie: has the `lineno` attribute set to zero
* Ensure that the `.new` method:
  * Raises an `Errno::ENOENT` exception when given a filename that doesn't exist
  * Does not raise an error when given a valid filename