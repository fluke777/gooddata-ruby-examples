# encoding: utf-8

require 'gooddata'

client = GoodData.connect

blueprint = GoodData::Model::ProjectBlueprint.build('Acme project') do |p|
  p.add_date_dimension('committed_on')

  p.add_dataset('commits') do |d|
    d.add_fact('lines_changed')
	  d.add_attribute('name')
    d.add_date('committed_on', :dataset => 'committed_on', :format => 'dd/MM/yyyy')
  end
end

project = client.create_project_from_blueprint(blueprint)

data = [
  ['lines_changed', 'name', 'committed_on'],
  [1, 'tomas', '01/01/2001'],
  [1, 'petr', '01/12/2001'],
  [1, 'jirka', '24/12/2014']]

project.upload(data, blueprint, 'commits')

# Now the data are loaded in. You can easily compute some number
project.facts.first.create_metric(type: :sum).execute # => 3

# By default data are loaded in full mode. This means that data override all previous data in the dataset
data = [
  ['lines_changed', 'name', 'committed_on'],
  [10, 'tomas', '01/01/2001'],
  [10, 'petr', '01/12/2001'],
  [10, 'jirka', '24/12/2014']]
project.upload(data, blueprint, 'commits')
project.facts.first.create_metric(type: :sum).execute # => 30

# You can also load more data through INCREMENTAL mode
project.upload(data, blueprint, 'commits', :mode => 'INCREMENTAL')
project.facts.first.create_metric(type: :sum).execute # => 60