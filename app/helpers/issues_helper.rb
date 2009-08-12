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

  def issue_status_checkbox(status, count=0)

    if session[:filter_by_issue_status]
      checked = session[:filter_by_issue_status].split(",").include?(status.to_s)
    else
      checked = count > 0
    end

    check_box_tag("status[]", status, checked,
      :onclick => remote_function(:url => { :action => :filter }, 
        :with => %Q/"status=" + $$("input[name='status[]']").findAll(function (el) { return el.checked }).pluck("value")/
      )
    )
  end

  # TODO- add support for linking to tickets on systems besides bugzilla
  def link_to_bug_ticket(ticket)
    link_to ticket, "https://bugzilla.systems.pccl.info/show_bug.cgi?id=#{ticket}", :target => "_blank"
  end

  def show_resolve_bug?
    if session[:bug_ticket].blank?
      {:style => "display:none;"}
    else
      {:style => "display:block;" }
    end
  end

end
