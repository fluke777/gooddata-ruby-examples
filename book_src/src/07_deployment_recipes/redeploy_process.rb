# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_id')
process = project.processes('process_id')
process.deploy('path_to_your_process')