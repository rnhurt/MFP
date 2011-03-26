module ApplicationHelper
  # Make it easy to set a page title
  def title(page_title)
    content_for(:title) { page_title }
  end

  # Show the FLASH div if there is data in the flash object.
  def show_flash
    result = ''
    flash.each {|type, message| result << content_tag(:div, message, :id => 'notice', :class => "#{type.to_s} ui-state-highlight ui-corner-all") }
    return result.html_safe
  end
end
