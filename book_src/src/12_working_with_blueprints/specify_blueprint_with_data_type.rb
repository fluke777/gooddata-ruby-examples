# encoding: utf-8

require 'gooddata'

client = GoodData.connect

blueprint = GoodData::Model::ProjectBlueprint.build('Acme project') do |p|
  p.add_date_dimension('committed_on')

  p.add_dataset('commits') do |d|
    d.add_fact('lines_changed', gd_data_type: 'integer')
	  d.add_attribute('name')
    d.add_date('committed_on', :dataset => 'committed_on', :format => 'dd/MM/yyyy')
  end
end
