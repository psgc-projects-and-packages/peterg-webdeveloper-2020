require 'date'

namespace :devseed do
  task :monthperiod => :environment do
    #ActiveRecord::Base.connection.execute("TRUNCATE monthperiods")
    Project.destroy_all
    Monthperiod.destroy_all

    start_date = Time.local(1901)
    end_date = Time.local(2000, 12, 31)

    year_iter = 1991
    end_year = 2039

    while year_iter <= end_year
      # months
      (1...12).to_a.map do |m| 
        Monthperiod.create!({
          period_year: year_iter,
          month_number: m,
          start_date: Time.local(year_iter, m, 1).to_s(:db),
          end_date: Date.civil(year_iter, m, -1).to_s(:db)
        })
      end
      year_iter += 1
    end

  end

end

# puts JSON.pretty_generate Monthperiod.all.map(&:attributes)
# Project.create!({ ptitle: "test", startdate_id: 26, enddate_id: 27 })
