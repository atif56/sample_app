require 'spec_helper'

describe PagesController do
  render_views # by default RSpec just tests actions inside a controller test; if we want it also to render the views, 
               # we have to tell it explicitly via the second line:
  
  describe "GET 'home'" do # The first line indicates that we are describing a GET operation for the home action. 
                           # "GET ’home’" indicates that the test corresponds to an HTTP GET request, as discussed in Box 3.
						   # Inside of RSpec, this line actually submits a GET request; in other words, it acts like a browser 
						   # and hits a page, in this case /pages/home
    it "should be successful" do
      get 'home'
      response.should be_success # When we write response.should be_success in an RSpec test, RSpec verifies that our application’s 
	                             # response to the request is status code 200.
    end
	
	it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                    :content => "Ruby on Rails Tutorial Sample App | Home")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
	it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
                        :content =>
                          "Ruby on Rails Tutorial Sample App | Contact")
    end
  end
  
  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
	it "should have the right title" do
      get 'about'
      response.should have_selector("title",
                        :content =>
                          "Ruby on Rails Tutorial Sample App | About")
    end
  end


end
