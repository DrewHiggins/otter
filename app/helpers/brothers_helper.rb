module BrothersHelper
  def status_pill(status)
    unless status.nil?
      return content_tag(:span, status, class: "status-pill #{status.downcase}")
    else
      return ""
    end
  end
end
