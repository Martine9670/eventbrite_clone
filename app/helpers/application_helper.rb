module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :notice then "success"
    when :alert then "danger"
    else "info"
    end
  end

def back_to_events_list_path
    if user_signed_in?
      root_path
    else
      "#"
    end
  end
end
