require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IssuesController do

  before(:each) do
    require_user
    set_current_tab(:issues)
  end

  describe "responding to GET index" do

    before(:each) do
    end

    it "should expose all issues as @issues and render [index] template" do
      @issues = [ Factory(:issue, :user => @current_user) ]

      get :index
      assigns[:issues].should == @issues
      response.should render_template("issues/index")
    end

    it "should expose the data for the issues sidebar"

    describe "AJAX pagination" do
      it "should pick up page number from params" do
        @issues = [ Factory(:issue, :user => @current_user) ]
        xhr :get, :index, :page => 42

        assigns[:current_page].to_i.should == 42
        assigns[:issues].should == [] # page #42 should be empty
        session[:issues_current_page].to_i.should == 42
        response.should render_template("issues/index")
      end

      it "should pick up saved page number from session" do
        session[:issues_current_page] = 42
        @issues = [ Factory(:issue, :user => @current_user) ]
        xhr :get, :index

        assigns[:current_page].to_i.should == 42
        assigns[:issues].should == [] # page #42 should be empty
        response.should render_template("issues/index")
      end
    end

    describe "with mime type of XML" do
      it "should render all issues as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        @issues = [ Factory(:issue, :user => @current_user) ]

        get :index
        response.body.should == @issues.to_xml
      end
    end
  end
end
