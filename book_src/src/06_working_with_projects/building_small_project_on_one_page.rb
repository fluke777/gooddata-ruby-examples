# encoding: utf-8

require 'gooddata'

GoodData.with_connection('user', 'password') do |client|
  blueprint = GoodData::Model::ProjectBlueprint.build('Acme project') do |p|
    p.add_date_dimension('committed_on')

    p.add_dataset('devs') do |d|
      d.add_anchor('dev_id')
      d.add_label('email', :reference => 'dev_id')
    end

    p.add_dataset('commits') do |d|
      d.add_fact('lines_changed')
      d.add_date('committed_on', :dataset => 'committed_on')
      d.add_reference('dev_id', :dataset => 'devs')
    end
  end

  project = GoodData::Project.create_from_blueprint(blueprint, auth_token: '')
  puts "Created project #{project.pid}"

  GoodData::with_project(project) do |p|
    # Load data
    commits_data = [
      %w(lines_changed committed_on dev_id repo_id),
      [1, '01/01/2014', 1, 1],
      [3, '01/02/2014', 2, 2],
      [5, '05/02/2014', 3, 1]]
    GoodData::Model.upload_data(commits_data, blueprint, 'commits')

    devs_data = [
      ["dev_id", "email"],
      [1, 'tomas@gooddata.com'],
      [2, 'petr@gooddata.com'],
      [3, 'jirka@gooddata.com']]
    GoodData::Model.upload_data(devs_data, blueprint, 'devs')

    # create a metric
    metric = p.facts('fact.commits.lines_changed').create_metric
    metric.save

    report = p.create_report(title: 'Awesome_report', top: [metric], left: ['label.devs.dev_id.email'])
    report.save

    ['john@example.com'].each do |email|
      p.invite(email, 'admin', "Guys checkout this report #{report.browser_uri}")
    end
  end
end
