# encoding: utf-8

require 'gooddata'

# Connect to platform using credentials
client = GoodData.connect
project = client.projects(PROJECT_PID)

user = project.member('john@example.com')
user.disable
# You can reenable the user again
user.enable
