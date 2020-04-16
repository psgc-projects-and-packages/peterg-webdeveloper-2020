class Monthperiod < ApplicationRecord
  include Guidable
  include Sluggable

  Sluggable.set_target_fields :period_year, :month_number
end
