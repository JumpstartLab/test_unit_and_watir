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

```
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

```
def test_hello
  assert("hello".class == String)
end
```

If the contained expression is true, the test passes. If it's false or raises an exception, the test fails.

#### Beyond `assert`

Though `assert` can be used to test just about anything, there are many other assertions that can be more convenient. For instance, the above example could be rewritten using `assert_instance_of`:

```
def test_hello
  assert_instance_of(String, "hello")
end
```

Experienced Rubyists will leave off the parentheses to get a more sentence-like flow:

```
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
* `assert_raise(except1, except2, ...)  { block }` :Ensures that the given block raises one of the given exceptions.
* `assert_respond_to(obj, symbol, [msg])` : Ensures that obj has a method called symbol.

### Setup & Teardown

Tests frequently need to setup data at the beginning. Rather than repeating your initialization code in every test we write a `setup` method:

```ruby
class TestSample < Test::Unit::TestCase
  def setup
    @sample_data = "My sample data"
  end
  
  def test_hello
    assert_instance_of String, @sample_date
  end
end
```

The most important thing to note is that the `setup` method is executed *before each test*. So if it does something that takes significant time or computation it'll slow down every test. 

On the other end of the test is the `teardown` method which will be run after each test.

## Practice

# Introducing Watir
## Setup
### Browser
### Watir
### Watir-Webdriver
## Commands
### Loading Pages
### Querying
#### Finding Text
#### Window Title
### Clicking
#### Links
#### Buttons

# Watir & Test::Unit
## Revisiting the Basic Frame
## Useful Assertions
## Practice