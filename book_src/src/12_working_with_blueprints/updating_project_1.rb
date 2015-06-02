# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_id')

blueprint = GoodData::Model::ProjectBlueprint.build("my_blueprint") do |p|
  p.add_date_dimension("committed_on")

  p.add_dataset("repos") do |d|
    d.add_anchor("repo_id")
    d.add_attribute("name")
    d.add_date('opportunity_comitted', dataset: 'committed_on', format: "dd-MM-yyyy")
  end
end

project = client.create_project_from_blueprint(bp, auth_token: '')

update = GoodData::Model::ProjectBlueprint.build("update") do |p|
  p.add_dataset("repos") do |d|
    d.add_attribute("region")
  end
end

# update the model in the project
project.update_from_blueprint(blueprint.merge(update))

# now you can look at the model and verify there is new attribute present
project.attributes.find {|a| a.title == 'Region'}
