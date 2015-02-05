# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |client|
  project = GoodData.use('project_id')
  blueprint = project.blueprint

  # count the number of datasets (does not include date dimensions)
  blueprint.datasets.count # => 3

  # gives you list of attributes in the whole project
  blueprint.fields.filter { |x| x[:type].to_s == 'attribute' }

  # lists datasets that do have anchor (connection point)
  blueprint.datasets.select &:anchor?

  # Find all the star centers/fact tables (datasets that nobody else connects to)
  blueprint.find_star_centers
end