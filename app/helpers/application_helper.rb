module ApplicationHelper
  def add_to_calendar object, options = {}
    label = options.delete(:label) || ''
    link_to image_tag('icons/calendar_add.png').html_safe + label, "http://www.google.com/calendar/event?ctext=+#{object.calendar_string}+&action=TEMPLATE&pprop=HowCreated%3AQUICKADD", options
  end

  def error_for record, field
    record.errors[field].present? ? 'error': ''
  end

  def error_message_for record, field
    if record.errors[field].present?
      content_tag('span', :class => 'help-inline') do
        record.errors[field].join(',')
      end
    end
  end

  def breadcrumb project, commit, path
    return '' unless path
    out = ''
    breadcrumb = ''
    parts = path.split('/')
    out << link_to(project.name, tree_project_path(project))
    out << '/'
    parts.each do |p|
      breadcrumb = File.join(breadcrumb, p)
      out << (link_to p, tree_file_project_path(project, :path => breadcrumb, :commit_id => commit ))
      out <<  '/'
    end
    out.html_safe
  end
end
