module IssuesHelper

  def issue_priority_checkbox(priority, count=0)

    if session[:filter_by_issue_priority]
      checked = session[:filter_by_issue_priority].split(",").include?(priority.to_s)
    else
      checked = count > 0
    end

    check_box_tag("priority[]", priority, checked,
      :onclick => remote_function(:url => { :action => :filter }, 
        :with => %Q/"priority=" + $$("input[name='priority[]']").findAll(function (el) { return el.checked }).pluck("value")/
      )
    )
  end

end
