refactored_blueprint.datasets('dataset.sales')
# prints
# 
# {:id=>"dataset.sales",
#    :type=>:dataset,
#    :columns=>
#     [{:type=>:anchor, :id=>"attr.sales.id", :title=>"Sale Id"},
#      {:type=>:label,
#       :id=>"label.sales.id",
#       :reference=>"attr.sales.id",
#       :title=>"Sales tracking number"},
#      {:type=>:fact, :id=>"fact.sales.amount", :title=>"Amount"},
#      {:type=>:reference, :dataset=>"dataset.regions"},
#      {:type=>:reference, :dataset=>"dataset.reps"},
#      {:type=>:reference, :dataset=>"dataset.sales_dim"}]