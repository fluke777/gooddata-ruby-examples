refactored_blueprint = blueprint.refactor_split_df('dataset.sales')

# Let's have a look around
refactored_blueprint.datasets.map(&:title)

refactored_blueprint.datasets.map {|d| [d.title, d.id]}
=> [["Sale Reps", "dataset.reps"],
    ["Sale Reps", "dataset.regions"],
    ["Department", "dataset.sales"],
    ["Dataset.Sales Dim", "dataset.sales_dim"]]

# So there is a new dataset
# If we print it out in repl
refactored_blueprint.datasets('dataset.sales_dim')
# prints
# 
# {
#   :type=>:dataset,
#   :id=>"dataset.sales_dim",
#   :columns=>
#    [{:type=>:anchor, :id=>"vymysli_id"},
#     {:type=>:label, :id=>"label.vymysli_id", :reference=>"vymysli_id"},
#     {:type=>:attribute, :id=>"attr.sales.stage", :title=>"Stage"},
#     {:type=>:label,
#      :id=>"label.sales.stage",
#      :title=>"Stage Name",
#      :reference=>"attr.sales.stage"}]}