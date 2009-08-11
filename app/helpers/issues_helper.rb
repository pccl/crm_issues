module IssuesHelper

  def issue_priority_checkbox(priority, count=0)
    checked = false
    check_box_tag("priority[]", priority, checked,
      :onclick => remote_function(:url => { :action => :filter }, 
        :with => %Q/"priority=" + $$("input[name='priority[]']").findAll(function (el) { return el.checked }).pluck("value")/
      )
    )
  end

end
