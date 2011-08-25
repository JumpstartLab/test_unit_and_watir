require "rubygems"
require "test/unit"
require "watir-webdriver"

class JumpstartLab < Test::Unit::TestCase
  def initialize(*args)
    super
    @browser ||= Watir::Browser.new
  end
  
  def setup    
    @browser.goto "http://jumpstartlab.com"
  end

  def teardown
    @browser.close
  end

  def test_title
    assert @browser.title.include?("The Best Ruby on Rails Training")
  end
  
  def test_more_title
    assert @browser.title.include?("Jumpstart Lab")
  end
  
  def test_courses
    @browser.link(:href, "/courses").click
    assert @browser.text.include?("Perl")
  end
end