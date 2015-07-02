# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_id')
bp = project.blueprint

# now you can start working with it
blueprint.datasets.count # => 3
blueprint.datasets(:all, include_date_dimensions: true).count # => 4
blueprint.attributes.map(&:title)

# You can also store it into file as json
bp.store_to_file('model.json')
