require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should save a single Project" do
    # [ ] find monthperiod records
    start_date = Monthperiod.where(period_year: 2019, month_number: 2).first
    end_date = Monthperiod.where(period_year: 2019, month_number: 3).first
    obj = Project.create!({
      ptitle: "Some Great New Project",
      client: "Acme Inc",
      startdate_id: start_date.id,
      enddate_id: end_date.id
    })
    obj.reload
    assert_equal 'Some Great New Project', obj.ptitle
    assert obj.guid != nil
    assert obj.slug != nil
  end
end
