class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.string   :bug_ticket, :summary, :priority
      t.boolean  :bug_resolved, :issue_resolved
      t.integer  :account_id
      t.datetime :due_at
    end
  end

  def self.down
    drop_table :issues
  end
end