class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  belongs_to :assignee, :class_name => "User", :foreign_key => :assigned_to
  has_one    :account_issue, :dependent => :destroy
  has_one    :account, :through => :account_issue

  uses_user_permissions
  acts_as_commentable
  acts_as_paranoid

  def self.allowed_statuses
    [[ "Unresolved", 0 ], [ "Bug resolved", 1 ], [ "Issue resolved", 2 ]]
  end

  def status_in_words
    Issue.allowed_statuses.map{ |s| s.first }[self.status]
  end

  validates_presence_of :name, :message => "^Please provide an issue name."

  def update_with_account_and_permissions(params)
    account = Account.create_or_select_for(self, params[:account], params[:users])
    self.account_issue = AccountIssue.new(:account => account, :issue => self) unless account.id.blank?
    self.update_with_permissions(params[:issue], params[:users])
  end

  def save_with_account_and_permissions(params)
    account = Account.create_or_select_for(self, params[:account], params[:users])
    self.account_issue = AccountIssue.new(:account => account, :issue => self) unless account.id.blank?
    #self.contacts << Contact.find(params[:contact]) unless params[:contact].blank?
    self.save_with_permissions(params[:users])
  end

end
