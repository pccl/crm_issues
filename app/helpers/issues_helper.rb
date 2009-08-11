module IssuesHelper

  def issue_priority_checkbox(priority, count=0)
    checked = false
    check_box_tag("priority[]", priority, checked)
  end

end
