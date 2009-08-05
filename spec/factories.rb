Factory.define :account_issue do |a|
  a.account             { |a| a.association(:account) }
  a.issue               { |a| a.association(:issue) }
  a.deleted_at          nil
  a.updated_at          { Factory.next(:time) }
  a.created_at          { Factory.next(:time) }
end

Factory.define :issue do |i|
  i.summary         { Faker::Lorem::paragraph(1) } # Careful that generated text doesn't exceed 255 chars!
  i.priority        { %w( low minor major critical).rand }
  i.access          "Private"
  i.bug_ticket      { (1000 + rand*1000).to_i }
  i.bug_resolved    false
  i.issue_resolved  false
  i.user            { |a| a.association(:user) }
  i.assigned_to     nil
  i.due_on          { Factory.next(:date) }
  i.deleted_at      nil
  i.updated_at      { Factory.next(:time) }
  i.created_at      { Factory.next(:time) }
end
