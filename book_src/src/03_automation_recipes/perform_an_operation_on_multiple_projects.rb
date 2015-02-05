# encoding: utf-8

require 'gooddata'

client = GoodData.connect('user', 'password')

projects = [
  client.projects('project_pid_a'),
  client.projects('project_pid_b')
]

GoodData.with_connection('user', 'password') do |client|
  results = projects.map do |project|
    GoodData.with_project(project) do |project|

      reports_to_validate = project.reports
                              .select { |reports| report.updated_at > 2.weeks.ago }
                              .select { |report| report.revisions.count > 1 }

      GoodData::Report.find_by_tag('to_be_checked', :project => project).each do |report|
        report.remove_tag('to_be_checked')
        report.save
      end

      reports_to_validate.each do |report|
        report.add_tag('to_be_checked')
        report.save
      end

      {project: project, reports_to_validate: reports_to_validate.count}
    end
  end

  results.each do |result|
    puts "#{result[:project].pid}: there are #{result[:reports_to_validate]} reports to check"
  end
end

# And disconnect finally
puts 'Disconnecting ...'
GoodData.disconnect