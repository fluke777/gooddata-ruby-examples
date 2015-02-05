watch( '*/**/.erb' )  { |match_data_object| system "rake build" }

