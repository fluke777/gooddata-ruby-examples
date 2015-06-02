# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_id')

# You can select the dataset in several ways
dataset = project.datasets.find {|d| d.title == 'Users'}
dataset = project.datasets('dataset.users')
dataset = project.datasets(345)
dataset.delete_data
# dataset.synchronize works as well

