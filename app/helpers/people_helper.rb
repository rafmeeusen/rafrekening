module PeopleHelper
  def person_path(name)
    root_path + params[:secret] + "/people/" + name
  end
  def current_person_path
    person_path params[:name]
  end
  def person_edit_path(name)
    person_path(name) + "/edit"
  end
end
