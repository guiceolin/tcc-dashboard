module ProjectsHelper
  def add_project_to_calendar project
    link_to image_tag('icons/calendar_add.png'), "http://www.google.com/calendar/event?ctext=+#{project.calendar_string}+&action=TEMPLATE&pprop=HowCreated%3AQUICKADD"
  end
end
