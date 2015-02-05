reports_to_tag.each do |report|
  report.add_tag('to_be_checked')
  report.save
end