require 'gooddata'

client = GoodData.connect
project = client.projects('project_id')
project.title = "New and much better title"
project.save
