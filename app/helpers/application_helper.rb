module ApplicationHelper
  def current_class_by(path:)
    return 'active' if request.path == path
  end
end
