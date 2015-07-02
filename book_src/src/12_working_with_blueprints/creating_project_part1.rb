# encoding: utf-8

require 'gooddata'

client = GoodData.connect

blueprint = GoodData::Model::ProjectBlueprint.build("My project from blueprint") do |p|
  p.add_date_dimension('created_on')

  p.add_dataset('dataset.users') do |d|
    d.add_anchor('attr.users.id')
    d.add_date('created_on')
    d.add_fact('fact.users.some_number')
  end
end

blueprint.valid? # => true

project = client.create_project_from_blueprint(blueprint, auth_token: 'token')

# After the project is created (might take a while) you can start using it
project.title # => "My project from blueprint"
project.datasets.count # => 2
project.facts('fact.users.some_number').identifier # => 'fact.users.some_number'
