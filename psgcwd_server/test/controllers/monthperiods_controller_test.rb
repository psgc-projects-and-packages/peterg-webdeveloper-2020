require 'test_helper'

class MonthperiodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monthperiod = monthperiods(:one)
  end

  test "should get index" do
    get monthperiods_url
    assert_response :success
  end

  test "should get new" do
    get new_monthperiod_url
    assert_response :success
  end

  test "should create monthperiod" do
    assert_difference('Monthperiod.count') do
      post monthperiods_url, params: { monthperiod: { end_date: @monthperiod.end_date, guid: @monthperiod.guid, month_number: @monthperiod.month_number, period_year: @monthperiod.period_year, slug: @monthperiod.slug, start_date: @monthperiod.start_date } }
    end

    assert_redirected_to monthperiod_url(Monthperiod.last)
  end

  test "should show monthperiod" do
    get monthperiod_url(@monthperiod)
    assert_response :success
  end

  test "should get edit" do
    get edit_monthperiod_url(@monthperiod)
    assert_response :success
  end

  test "should update monthperiod" do
    patch monthperiod_url(@monthperiod), params: { monthperiod: { end_date: @monthperiod.end_date, guid: @monthperiod.guid, month_number: @monthperiod.month_number, period_year: @monthperiod.period_year, slug: @monthperiod.slug, start_date: @monthperiod.start_date } }
    assert_redirected_to monthperiod_url(@monthperiod)
  end

  test "should destroy monthperiod" do
    assert_difference('Monthperiod.count', -1) do
      delete monthperiod_url(@monthperiod)
    end

    assert_redirected_to monthperiods_url
  end
end
