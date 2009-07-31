class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.string   :bug_ticket, :summary, :priority
      t.boolean  :bug_resolved, :issue_resolved
      t.integer  :account_id, :user_id
      t.date :due_on
      t.datetime :deleted_at

      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
