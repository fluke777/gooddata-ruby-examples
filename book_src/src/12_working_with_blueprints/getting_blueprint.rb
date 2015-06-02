# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_id')
bp = project.blueprint
bp.store_to_file('model.json')
