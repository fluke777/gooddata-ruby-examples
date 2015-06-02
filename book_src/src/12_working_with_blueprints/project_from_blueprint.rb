# encoding: utf-8

require 'gooddata'

client = GoodData.connect

blueprint = GoodData::Model::ProjectBlueprint.build("my_bp") do |p|
  p.add_date_dimension('created_on')

  p.add_dataset('stuff') do |d|
    d.add_date('created_on', dataset: 'created_on')
    d.add_fact('some_number')
  end
end

project = client.create_project_from_blueprint(blueprint, auth_token: 'token')

# After the project is created (might take a while) you can start using it
project.title # => "my_bp"
project.datasets.count # => 2