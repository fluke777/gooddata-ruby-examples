# encoding: UTF-8

require 'gooddata'

# Project ID
PROJECT_ID = 'we1vvh4il93r0927r809i3agif50d7iz'

# Connect to GoodData platform
c = GoodData.connect('user', 'password')

GoodData.with_connection do |c|
    project = c.project(PROJECT_ID)

    path = File.join(File.dirname(__FILE__), '..', '..', 'data', 'users.csv')
    puts "Loading #{path}"
    CSV.foreach(path) do |row|
        email = row[0]
        role_name = row[1]
        user = project.users.find { |user| user.email == email }
        role = project.roles.find { |role| role.title == role_name }
        project.set_user_roles(user, role)
    end
end