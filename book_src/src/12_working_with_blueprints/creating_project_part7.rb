blueprint = GoodData::Model::ProjectBlueprint.build("My project from blueprint") do |p|
  p.add_dataset('dataset.users') do |d|
    d.add_anchor('attr.users.id')
    d.add_attribute('attr.users.name')
    d.add_label('attr.users.name.full_name', reference: 'attr.users.name')
  end

  p.add_dataset('dataset.sales') do |d|
    d.add_anchor('attr.sales.id')
    d.add_fact('fact.sales.amount')
    d.add_reference('dataset.users')
  end
end

blueprint.valid? # => true