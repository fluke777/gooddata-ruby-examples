# encoding: utf-8

require 'gooddata'

client = GoodData.connect

blueprint = GoodData::Model::ProjectBlueprint.build("my_bp") do |p|
  p.add_dataset('sales_reps', title: 'Awesome Sales Reps') do |d|
    d.add_anchor('id')
    d.add_attribute('name')
  end

  p.add_dataset('regions') do |d|
    d.add_anchor('id')
    d.add_attribute('name')
  end
  
  p.add_dataset('opportunities') do |d|
    d.add_fact('amount', folder: 'My Special Folder')
    d.add_reference('sales_rep_id', dataset: 'sales_reps')
    d.add_reference('region_id', dataset: 'regions')
  end
end

project = client.create_project_from_blueprint(blueprint, auth_token: 'token_id')

# Currently there is not support in SDK to directly explore folders but we can reach to API directly
# You can also go to the project in your browser and look for folders there
client.get("#{project.md['query']}/dimensions")['query']['entries'].map {|i| i['title']} # => ["Sales Reps", "Regions", "Opportunities"]

client.get("#{project.md['query']}/folders")['query']['entries'].map {|i| i['title']} # => ["My Special Folder"]