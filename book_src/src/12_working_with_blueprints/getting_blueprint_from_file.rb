# encoding: utf-8

require 'gooddata'

GoodData.with_connection do |c|
  blueprint = GoodData::Model::ProjectBlueprint.from_json('your_file.json')
  c.create_project_from_blueprint(blueprint, auth_token: TOKEN)
end
