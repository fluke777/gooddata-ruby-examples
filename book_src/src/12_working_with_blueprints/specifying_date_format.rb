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
    d.add_date('committed_on', :dataset => 'committed_on')
  end
end

# By default the dates are expected in format MM/dd/yyyy
data = [
  ['fact.commits.lines_changed', 'label.commits.name', 'committed_on'],
  [1, 'tomas', '01/01/2001'],
  [1, 'petr', '12/01/2001'],
  [1, 'jirka', '12/24/2014']]
project.upload(data, blueprint, 'dataset.commits')
puts project.compute_report(top: [project.facts.first.create_metric], left: ['committed_on.date'])
# prints
#
# [01/01/2001 | 3.0]
# [12/01/2001 | 3.0]
# [12/24/2014 | 3.0]

# if you try to load a differen format it will fail
data = [['fact.commits.lines_changed', 'label.commits.name', 'committed_on'],
        [1, 'tomas', '2001-01-01']]
project.upload(data, blueprint, 'dataset.commits')

# You can specify a different date format
blueprint = GoodData::Model::ProjectBlueprint.build('Acme project') do |p|
  p.add_date_dimension('committed_on')

  p.add_dataset('dataset.commits') do |d|
    d.add_anchor('attr.commits.id')
    d.add_fact('fact.commits.lines_changed')
	  d.add_attribute('attr.commits.name')
    d.add_label('label.commits.name', reference: 'attr.commits.name')
    d.add_date('committed_on', :dataset => 'committed_on', format: 'yyyy-dd-MM')
  end
end

data = [
  ['fact.commits.lines_changed', 'label.commits.name', 'committed_on'],
  [3, 'tomas', '2001-01-01'],
  [3, 'petr', '2001-01-12'],
  [3, 'jirka', '2014-24-12']]
project.upload(data, blueprint, 'dataset.commits')
puts project.compute_report(top: [project.facts.first.create_metric], left: ['committed_on.date'])
# prints
#
# [01/01/2001 | 3.0]
# [12/01/2001 | 3.0]
# [12/24/2014 | 3.0]