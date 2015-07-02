blueprint = GoodData::Model::ProjectBlueprint.build("My project from blueprint") do |p|
  p.add_dataset('dataset.users') do |d|
    d.add_anchor('attr.users.id')
    d.add_attribute('attr.users.name')
  end
end

blueprint.valid? # => false
blueprint.validate # => [{:type=>:attribute_without_label, :attribute=>"attr.users.name"}]