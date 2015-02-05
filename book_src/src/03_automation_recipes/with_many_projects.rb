projects = [
  GoodData::Project['project_pid_a'],
  GoodData::Project['project_pid_b']
]
GoodData.with_connection('user', 'password') do |c|
  projects.each do |project|
    GoodData.with_project(project) do |project|
      # do your thing
    end
  end
end