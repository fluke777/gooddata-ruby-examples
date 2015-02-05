# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |client|
  project = GoodData.use('project_id')

  project = GoodData.use('project_id')
  blueprint = project.blueprint

  # NEED TO BE CHECKED PROBABLY DOES NOT WORK OUT OF THE BOX
  blueprint.date_facts.count
  blueprint.date_facts.each { |df| puts df[:name] }
end