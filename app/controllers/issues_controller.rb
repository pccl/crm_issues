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
    @account = Account.new(:user => @current_user)
    @accounts = Account.my(@current_user).all(:order => "name")

    respond_to do |format|
      format.js
      format.xml { render :xml => @issue }
    end
  end

  def create
    @issue = Issue.new(params[:issue])

    respond_to do |format|
      # TODO: save_with_account_and_permissions
      if @issue.save_with_account(params)
        # update_sidebar if called_from_index_page?
        format.js
      else
        format.js
      end
    end
  end
end
