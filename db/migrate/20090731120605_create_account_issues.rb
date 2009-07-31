class CreateAccountIssues < ActiveRecord::Migration
  def self.up
    create_table :account_issues, :force => true do |t|
      t.references :account
      t.references :issue
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def self.down
    drop_table :account_issues
  end
end
