# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects(PROJECT_ID)
project.metrics.pmap do |metric|
  metric.content['format'] = metric.content['format'].gsub('$', '€')
  metric.save
end
