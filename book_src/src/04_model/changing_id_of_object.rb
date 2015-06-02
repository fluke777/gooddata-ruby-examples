# encoding: utf-8

require 'gooddata'

client = GoodData.connect
project = client.projects('project_id')

# We find the attribute we want to change
# Lets list all attributes in the project
# and print its title and identifier
project.attributes.map {|a| [a.identifier, a.title]}

# Let's pick one
# Here I just pick the first one
attribute = project.attributes.first

# but you can also pick one by identifier. For example
# attribute = project.attributes('attr.salesmem.country')

# We have a look at the current value.
# Let's say it is 'attr.users.region'
puts attribute.identifier

# We change the value
attribute.identifier = 'attr.salesmen.region'
attribute.save

# If we refresh the value from server
# we get a new value 'attr.salesmen.region'
attribute.reload!
puts attribute.identifier