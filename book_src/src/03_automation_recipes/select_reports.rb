reports_to_tag = p.reports
                   .select { |reports| report.updated_at > 2.weeks.ago }
                   .select { |report| report.revisions.count > 1 }