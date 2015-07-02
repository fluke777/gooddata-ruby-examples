blueprint = GoodData::Model::ProjectBlueprint.build("My project from blueprint") do |p|
  p.add_dataset('dataset.users') do |d|
    d.add_anchor('attr.users.id')
    d.add_anchor('attr.users.id2')
  end
end

blueprint.valid? # => false
blueprint.validate # => [{:type=>:more_than_on_anchor, :dataset=>"dataset.users"}]