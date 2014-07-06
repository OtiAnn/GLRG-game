module ApplicationHelper
  def selected_id menu_path
    request.path.start_with?(menu_path) ? 'selected' : ''
  end

  def menu_link name, path
    link_to name, path + '#menubar', :class => "menu-link", :id => selected_id(path)
  end
end
