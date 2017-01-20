module ApplicationHelper
  def alert_class_for(flash_type)
    {
      success: "alert--positive",
      error: "alert--negative",
      notice: "alert--warning"
    }[flash_type.to_sym]
  end

  def flash_messages(opts = {})
    flash.map do |msg_type, message|
      content_tag :div, class: "alert #{alert_class_for(msg_type)} alert-top" do
        concat content_tag(:a, content_tag(:span, "", class: 'icon icon_delete'), class: 'close')
        concat content_tag :span, message, class: 'alert-message'
      end
    end.join.html_safe
  end

  def form_error(object, field_name)
    if object.errors.any?
      unless object.errors.messages[field_name].blank?
        content_tag :span, object.errors.messages[field_name].join(", "), class: "text-danger error pull-left"
      end
    end
  end

  def active?(link_path)
    request.fullpath == link_path ? "active" : ""
  end
end
