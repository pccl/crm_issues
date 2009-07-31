class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :account

  # uses_user_permissions
  acts_as_paranoid

  def update_with_account(params)
    self.update_attributes(params[:issue])
    save_with_account(params)
  end

  def save_with_account(params)
    account = Account.create_or_select_for(self, params[:account], params[:users])
    self.account = account
    self.save
  end

end
