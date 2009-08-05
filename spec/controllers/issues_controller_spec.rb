require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IssuesController do

  before(:each) do
    require_user
    set_current_tab(:issues)
  end

  # GET /issues
  # GET /issues.xml
  #----------------------------------------------------------------------------
  describe "responding to GET index" do

    before(:each) do
      #get_data_for_sidebar
    end

    it "should expose all issues as @issues and render [index] template" do
      @issues = [ Factory(:issue, :user => @current_user) ]

      get :index
      assigns[:issues].should == @issues
      response.should render_template("issues/index")
    end

    it "should expose the data for the issues sidebar"

    it "should filter out issues by priority"

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

  # GET /issues/1
  # GET /issues/1.xml                                               HTML
  #----------------------------------------------------------------------------
  describe "responding to GET show" do
    describe "with mime type of HTML" do
      before(:each) do
        @issue = Factory(:issue, :id => 42)
        @comment = Comment.new
      end

      it "should expose the requested issue as @issue and render the [show] template" do
        get :show, :id => 42
        assigns[:issue].should == @issue
        assigns[:comment].attributes.should == @comment.attributes
        response.should render_template("issues/show")
      end

      it "should update an activity when viewing the issue" # do
        #Activity.should_receive(:log).with(@current_user, @issue, :viewed).once
        #get :show, :id => @issue.id
      #end
    end

    describe "with the mime type of XML" do
      it "should render the requested issue as XML" do
        @issue = Factory(:issue, :id => 42)

        request.env["HTTP_ACCEPT"] = "application/xml"
        get :show, :id => 42
        response.body.should == @issue.to_xml
      end
    end

    describe "issue got deleted or otherwise unavailable" do
      it "should redirect to issues index if the issue got deleted" do
        @issue = Factory(:issue, :user => @current_user).destroy

        get :show, :id => @issue.id
        flash[:warning].should_not == nil
        response.should redirect_to(issues_path)
      end

      it "should redirect to issues index if the issue is protected" do
        @private = Factory(:issue, :user => Factory(:user), :access => "Private")

        get :show, :id => @private.id
        flash[:warning].should_not == nil
        response.should redirect_to(issues_path)
      end
    end
  end
end
