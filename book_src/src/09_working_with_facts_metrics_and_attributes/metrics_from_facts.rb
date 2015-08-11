# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    fact = project.facts('fact.commits.lines_changed')
    metric = fact.create_metric(:title => "Sum of [#{fact.identifier}]")
    metric.save
    res = metric.execute
    puts res

    # Default aggregation is SUM but you can also specify a different one
    metric = fact.create_metric(:title => "Sum of [#{fact.identifier}]", type: :min)
  end
end