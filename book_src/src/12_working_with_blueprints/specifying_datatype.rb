# encoding: utf-8

require 'gooddata'

client = GoodData.connect

blueprint = GoodData::Model::ProjectBlueprint.build('Acme project') do |p|
  p.add_date_dimension('committed_on')

  p.add_dataset('dataset.commits') do |d|
    d.add_anchor('attr.commits.id')
    d.add_fact('fact.commtis.lines_changed', gd_data_type: 'integer')
	  d.add_attribute('attr.commits.name')
    d.add_label('label.commits.name', reference: 'attr.commits.name')
    d.add_date('committed_on', :format => 'dd/MM/yyyy')
  end
end

# This is going to fail since we are trying to upload 1.2 into INT numeric type
data = [['fact.commtis.lines_changed', 'label.commits.name', 'committed_on'],
        [1.2, 'tomas', '01/01/2001']]
project.upload(data, blueprint, 'dataset.commits')

# This is going to pass since we are trying to upload 1 into INT numeric type
data = [['fact.commtis.lines_changed', 'label.commits.name', 'committed_on'],
        [1, 'tomas', '01/01/2001']]
project.upload(data, blueprint, 'dataset.commits')
