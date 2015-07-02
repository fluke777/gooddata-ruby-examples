# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_id')

blueprint = GoodData::Model::ProjectBlueprint.build('Acme project') do |p|
  p.add_date_dimension('committed_on')

  p.add_dataset('dataset.commits') do |d|
    d.add_anchor('attr.commits.id')
    d.add_fact('fact.commits.lines_changed')
	  d.add_attribute('attr.commits.name')
    d.add_label('label.commits.name', reference: 'attr.commits.name')
    d.add_date('committed_on', :dataset => 'committed_on')
  end
end

project = client.create_project_from_blueprint(bp, auth_token: 'token')

update = GoodData::Model::ProjectBlueprint.build("update") do |p|
  p.add_dataset("dataset.commits") do |d|
    d.add_attribute("attr.commits.repo")
    d.add_label('label.commits.repo', reference: 'attr.commits.repo')
  end
end

# update the model in the project
project.update_from_blueprint(blueprint.merge(update))

# now you can look at the model and verify there is new attribute present
project.attributes('attr.commits.repo')