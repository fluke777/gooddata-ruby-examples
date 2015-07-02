# you define which dataset you would like to split. Secnd parameter is list of facts you would like to move and the last one is the id of the new dataset
refactored_blueprint = blueprint.refactor_split_facts('dataset.orders_fact', ['fact.dataset.orders_fact.amount_shipped'], 'dataset.orders_shipped_fact')

# Again Let's explore
refactored_blueprint.datasets.count # => 3

refactored_blueprint.datasets.map {|d| [d.title, d.id]}
# => [["Orders Dimension", "dataset.orders_dim"],
#     ["Orders Fact Table", "dataset.orders_fact"],
#     ["Dataset.Orders Shipped Fact", "dataset.orders_shipped_fact"]]

# There is a new dataset "dataset.orders_shipped_fact"
refactored_blueprint.datasets('dataset.orders_shipped_fact')
# prints
# 
# {
#   :id=>"dataset.orders_shipped_fact",
#   :type=>:dataset,
#   :columns=> [
#     {:type=>:anchor, :id=>"dataset.orders_shipped_fact.id"},
#     {:type=>:fact,
#      :id=>"fact.dataset.orders_fact.amount_shipped",
#      :title=>"Amount Shipped"},
#     {:type=>:reference, :dataset=>"dataset.orders_dim"}]}