blueprint = GoodData::Model::ProjectBlueprint.build('Not so great project') do |p|

  p.add_dataset('dataset.orders_dim', title: 'Orders Dimension') do |d|
    d.add_anchor('attr.orders_dim.id', title: 'Order')
    d.add_label('label.dataset.orders_dim.id', reference: 'attr.orders_dim.id', title: 'Order Id')
  end

  p.add_dataset('dataset.orders_fact', title: 'Orders Fact Table') do |d|
    d.add_anchor('attr.orders_fact.id', title: 'Sales Rep')
    d.add_fact('fact.dataset.orders_fact.amount_ordered', title: 'Amount Ordered')
    d.add_fact('fact.dataset.orders_fact.amount_shipped', title: 'Amount Shipped')
    d.add_reference('dataset.orders_dim')
  end
end