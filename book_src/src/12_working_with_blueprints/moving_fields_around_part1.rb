client = GoodData.connect
project = client.projects('PROJECT_ID')

blueprint = project.blueprint
blueprint.move!('attr.department.region', 'dataset.department', 'dataset.employee')
project.update_from_blueprint(blueprint)
