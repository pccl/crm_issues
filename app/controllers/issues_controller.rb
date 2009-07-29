class IssuesController < ApplicationController
  # Prevent error: 'A copy of ApplicationController has been removed
  # from the module tree but is still active!'
  #   http://tinyurl.com/nzu2y2
  unloadable

  before_filter :require_user
  before_filter :set_current_tab, :only => [:index]

  def index
    @issues = Issue.find(:all)
  end

  def new
    @issue = Issue.new(:user => @current_user)
    respond_to do |format|
      format.js
      format.xml { render :xml => @issue }
    end
  end

end
