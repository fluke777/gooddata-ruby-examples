GoodData::Report.find_by_tag('to_be_checked', :project => project).each do |report|
  report.remove_tag('to_be_checked')
  report.save
end