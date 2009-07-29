class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :account

  def save_with_account(params)
    account = Account.create_or_select_for(self, params[:account], params[:users])
    self.account = account
    self.save
  end

end
