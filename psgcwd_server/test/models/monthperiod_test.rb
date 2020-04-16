require 'test_helper'

# https://guides.rubyonrails.org/testing.html

class MonthperiodTest < ActiveSupport::TestCase
  test "should save a single monthperiod" do
    year = 2020
    m = 2
    obj = Monthperiod.create!({
      period_year: year,
      month_number: m,
      start_date: Time.local(year, m, 1).to_s(:db),
      end_date: Date.civil(year, m, -1).to_s(:db)
    })
    obj.reload
    assert_equal '2020', obj.period_year
    assert obj.guid != nil
    assert obj.slug != nil
  end
end
