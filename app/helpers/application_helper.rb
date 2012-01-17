module ApplicationHelper
  def title(val=false)
    if val
      @title = val
    else
      @title 
    end
  end
  def markdown(text)
    text.blank? ? "" : BlueCloth.new(text).to_html.html_safe
  end
end
