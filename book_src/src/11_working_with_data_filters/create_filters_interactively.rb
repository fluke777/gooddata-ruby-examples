# encoding: utf-8

require 'gooddata'

client = GoodData.conect('login', 'password')
project = client.projects('project_id')

# First let's grab an attribute
attribute = project.attributes('attr.region.city')

# to set up a value we need a specific label
# if the attribute has only one label, you can easily grab it by calling #primary_label
label = attribute.primary_label

# if a label has multiple labels, you can select the correct one like this
# label = attribute.label_by_name('City name')

# Let's construct filters we are going to set up
# We will do it for two hypothetical users

filters = [
  ['john.doe@example.com', label.uri, 'San Francisco', 'Amsterdam']
  ['jane.doe@example.com', label.uri, 'San Francisco', 'Prague']
]

# Obvious question might be how do you know that the values are correct
# you can find out like this
# label.value?('Amsterdam')

# Let's now update the project
project.add_data_permissions(filters)