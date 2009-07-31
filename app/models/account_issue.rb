class AccountIssue < ActiveRecord::Base
  belongs_to :account
  belongs_to :issue
  validates_presence_of :account_id, :issue_id
end
