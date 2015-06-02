# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_id')
report = project.reports(1234)
begin
  puts report.execute(time_limit: 10)
rescue GoodData::ExecutionLimitExceeded => e
  puts "Unfortunately #{report.title} execution did not finish in 10 seconds"
  raise e
end
