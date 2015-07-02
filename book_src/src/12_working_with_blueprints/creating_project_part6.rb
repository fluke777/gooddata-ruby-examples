blueprint = GoodData::Model::ProjectBlueprint.build("My project from blueprint") do |p|
  p.add_date_dimension('created_on')

  p.add_dataset('dataset.users') do |d|
    d.add_anchor('attr.users.id')
    d.add_fact('fact.users.some_number')
    d.add_date('created_on')
  end
end