# encoding: utf-8

require 'gooddata'

client = GoodData.connect

blueprint = GoodData::Model::ProjectBlueprint.build('Acme project') do |p|
  p.add_date_dimension('committed_on')

  p.add_dataset('dataset.commits') do |d|
    d.add_anchor('attr.commits.id')
    d.add_fact('fact.commits.lines_changed')
	  d.add_attribute('attr.commits.name')
    d.add_label('label.commits.name', reference: 'attr.commits.name')
    d.add_date('committed_on', :format => 'dd/MM/yyyy')
  end
end

project = client.create_project_from_blueprint(blueprint, auth_token: 'TOKEN')

# By default names of the columns are the identifiers of the labels, facts, or names of references
data = [
  ['fact.commits.lines_changed', 'label.commits.name', 'committed_on'],
  [1, 'tomas', '01/01/2001'],
  [1, 'petr', '01/12/2001'],
  [1, 'jirka', '24/12/2014']]

project.upload(data, blueprint, 'dataset.commits')

# Now the data are loaded in. You can easily compute some number
project.facts.first.create_metric(type: :sum).execute # => 3

# By default data are loaded in full mode. This means that data override all previous data in the dataset
data = [
  ['fact.commits.lines_changed', 'label.commits.name', 'committed_on'],
  [10, 'tomas', '01/01/2001'],
  [10, 'petr', '01/12/2001'],
  [10, 'jirka', '24/12/2014']]
project.upload(data, blueprint, 'dataset.commits')
project.facts.first.create_metric(type: :sum).execute # => 30

# You can also load more data through INCREMENTAL mode
project.upload(data, blueprint, 'dataset.commits', :mode => 'INCREMENTAL')
project.facts.first.create_metric(type: :sum).execute # => 60

# If you want to you can also specify what the names of the columns in the CSV is going to be

blueprint = GoodData::Model::ProjectBlueprint.build('Acme project') do |p|
  p.add_date_dimension('committed_on')

  p.add_dataset('dataset.commits') do |d|
    d.add_anchor('attr.commits.id')
    d.add_fact('fact.commits.lines_changed', column_name: 'fact')
	  d.add_attribute('attr.commits.name')
    d.add_label('label.commits.name', reference: 'attr.commits.name', column_name: 'label' )
    d.add_date('committed_on', :format => 'dd/MM/yyyy', column_name: 'ref')
  end
end

data = [
  ['fact', 'label', 'ref'],
  [10, 'tomas', '01/01/2001'],
  [10, 'petr', '01/12/2001'],
  [10, 'jirka', '24/12/2014']]
project.upload(data, blueprint, 'dataset.commits')
