require "application_system_test_case"

class MonthperiodsTest < ApplicationSystemTestCase
  setup do
    @monthperiod = monthperiods(:one)
  end

  test "visiting the index" do
    visit monthperiods_url
    assert_selector "h1", text: "Monthperiods"
  end

  test "creating a Monthperiod" do
    visit monthperiods_url
    click_on "New Monthperiod"

    fill_in "End date", with: @monthperiod.end_date
    fill_in "Guid", with: @monthperiod.guid
    fill_in "Month number", with: @monthperiod.month_number
    fill_in "Period year", with: @monthperiod.period_year
    fill_in "Slug", with: @monthperiod.slug
    fill_in "Start date", with: @monthperiod.start_date
    click_on "Create Monthperiod"

    assert_text "Monthperiod was successfully created"
    click_on "Back"
  end

  test "updating a Monthperiod" do
    visit monthperiods_url
    click_on "Edit", match: :first

    fill_in "End date", with: @monthperiod.end_date
    fill_in "Guid", with: @monthperiod.guid
    fill_in "Month number", with: @monthperiod.month_number
    fill_in "Period year", with: @monthperiod.period_year
    fill_in "Slug", with: @monthperiod.slug
    fill_in "Start date", with: @monthperiod.start_date
    click_on "Update Monthperiod"

    assert_text "Monthperiod was successfully updated"
    click_on "Back"
  end

  test "destroying a Monthperiod" do
    visit monthperiods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Monthperiod was successfully destroyed"
  end
end
