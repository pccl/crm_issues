module AccountIssueAssociations
  
  def self.included(base)
    base.class_eval do
      has_many :account_issues, :dependent => :destroy
      has_many :issues, :through => :account_issues, :uniq => true
    end
  end

end
