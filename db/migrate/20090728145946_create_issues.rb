class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.string   :bug_ticket, :summary, :priority
      t.string   :access, :limit => 8, :default => "Private" # %w(Private Public Shared)
      t.integer  :user_id, :assigned_to, :status
      t.date :due_on
      t.datetime :deleted_at

      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
