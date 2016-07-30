module ApplicationHelper
  def to_greek(class_name)
    greek_str = ""
    class_name.split(" ").each do |part|
      greek_str = greek_str + "&#{part}; "
    end
    return greek_str
  end
end
