blueprint = GoodData::Model::ProjectBlueprint.build("My project from blueprint") do |p|
  p.add_dataset('dataset.users') do |d|
    d.add_anchor('attr.users.id')
    d.add_attribute('attr.users.name')
    d.add_label('label.users.name.full_name', reference: 'attr.users.name')
    d.add_label('label.users.name.abbreviated_name', reference: 'attr.users.name')
  end
end

blueprint.valid? # => true
blueprint.validate # => []