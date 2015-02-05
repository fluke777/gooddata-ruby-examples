# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |client|
  GoodData.with_project('project_pid') do |project|
    report = project.report(32)
    result = report.execute
    fail "Report has unexpected result" unless result == [[1, 2, 3]]
  end
end