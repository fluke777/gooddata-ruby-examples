# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  blueprint = GoodData::Model::ProjectBlueprint.build('Acme project') do |p|
    p.add_date_dimension('committed_on')
    p.add_dataset('commits') do |d|
      d.add_fact('lines_changed')
	    d.add_attribute('name')
      d.add_date('committed_on', :dataset => 'committed_on')
    end
  end
  # By default the dates are expected in format MM/dd/yyyy
  data = [
    ['lines_changed', 'name', 'committed_on'],
    [1, 'tomas', '01/01/2001'],
    [1, 'petr', '01/12/2001'],
    [1, 'jirka', '24/12/2014']]
  project.upload(data, blueprint, 'commits')
  puts project.compute_report(top: [project.facts.first.create_metric], left: ['committed_on.date'])
  # print
  #
  # [01/01/2001 | 3.0]
  # [12/01/2001 | 3.0]
  # [12/24/2014 | 3.0]
  # if you try to load a differen format it will fail
  data = [['lines_changed', 'name', 'committed_on'],
    [1, 'tomas', '2001-01-01']]
  project.upload(data, blueprint, 'commits')
  # You can specify a different date format
  blueprint = GoodData::Model::ProjectBlueprint.build('Acme project') do |p|
    p.add_date_dimension('committed_on')
    p.add_dataset('commits') do |d|
      d.add_fact('lines_changed')
      d.add_attribute('name')
      d.add_date('committed_on', dataset: 'committed_on', format: 'yyyy-dd-MM')
    end
  end
  data = [
  ['lines_changed', 'name', 'committed_on'],
    [3, 'tomas', '2001-01-01'],
    [3, 'petr', '2001-01-12'],
    [3, 'jirka', '2014-24-12']]
  project.upload(data, blueprint, 'commits')
  puts project.compute_report(top: [project.facts.first.create_metric], left: ['committed_on.date'])
  # prints
  #
  # [01/01/2001 | 3.0]
  # [12/01/2001 | 3.0]
  # [12/24/2014 | 3.0]
end  