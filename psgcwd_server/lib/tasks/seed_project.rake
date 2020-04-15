require 'date'
require 'faker'

namespace :devseed do
  task :project => :environment do
    Project.destroy_all

    #byebug

    (1...10).to_a.map do |o| 
      dates = get_dates
      obj = Project.create!({
        ptitle: Faker::Company.bs,
        client: Faker::Company.name,
        startdate: dates[:start_date],
        enddate: dates[:end_date]
      })
    end
  end

  def get_dates

    # Get 2 random dates
    max_y = Monthperiod.maximum('period_year').to_i
    min_y = Monthperiod.minimum('period_year').to_i

    d1 = Monthperiod.where(
      period_year: rand(min_y...max_y),
      month_number: rand(1...12)
    ).first
    d2 = Monthperiod.where(
      period_year: rand(min_y...max_y),
      month_number: rand(1...12)
    ).first

    # Choose earlier date as the start date
    if d1.start_date < d2.start_date
      r = {start_date:  d1, end_date: d2}
    elsif
      r = {start_date:  d2, end_date: d1}
    end

    return r
  end

end

# puts JSON.pretty_generate Monthperiod.all.map(&:attributes)
# Project.create!({ ptitle: "test", startdate_id: 26, enddate_id: 27 })
