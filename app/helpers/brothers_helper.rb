module BrothersHelper
  def status_pill(status)
    return content_tag(:span, status, class: "status-pill #{status.downcase}")
  end
end
