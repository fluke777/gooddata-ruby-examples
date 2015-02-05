require 'gooddata'

GoodData.with_connection('user', 'password') do |c|
  project = GoodData.use('project_id')
  project.title = "New and much better title"
  project.save
end
