# Reopen the Account class from Fat Free CRM
# add a has_many :issues association
#
class Account < ActiveRecord::Base
  has_many :account_issues, :dependent => :destroy
  has_many :issues, :through => :account_issues, :uniq => true
end
