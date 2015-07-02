blueprint = GoodData::Model::ProjectBlueprint.build('Not so great project') do |p|
  p.add_dataset('dataset.reps', title: 'Sale Reps') do |d|
    d.add_anchor('attr.reps.id', title: 'Sales Rep')
    d.add_label('label.reps.id', reference: 'attr.reps.id', title: 'Sales Rep Name')
  end

  p.add_dataset('dataset.regions', title: 'Sale Reps') do |d|
    d.add_anchor('attr.regions.id', title: 'Sales Region')
    d.add_label('label.regions.id', reference: 'attr.regions.id', title: 'Sales Rep Name')
  end

  p.add_dataset('dataset.sales', title: 'Department') do |d|
    d.add_anchor('attr.sales.id', title: 'Sale Id')
    d.add_label('label.sales.id', reference: 'attr.sales.id', title: 'Sales tracking number')
    d.add_fact('fact.sales.amount', title: 'Amount')
    d.add_attribute('attr.sales.stage', title: 'Stage')
    d.add_label('label.sales.stage', title: 'Stage Name', reference:'attr.sales.stage')
    d.add_reference('dataset.regions')
    d.add_reference('dataset.reps')
  end
end