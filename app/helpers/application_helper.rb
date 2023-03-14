# frozen_string_literal: true

module ApplicationHelper
  def max_width
    if controller_name == 'texts' && action_name == 'show'
      'mw-md'
    else
      'mw-xl'
    end
  end

  def active_if(path)
    path == controller_path ? 'active' : ''
  end

  def sidebar_link_item(name, path)
    class_name = 'channel'
    class_name << ' active' if current_page?(path)

    content_tag :li, class: class_name do
      link_to name, path, class: 'channel_name'
    end
  end
end
