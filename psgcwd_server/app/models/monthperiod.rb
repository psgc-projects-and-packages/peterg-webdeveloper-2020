class Monthperiod < ApplicationRecord
  include Guidable
  include Sluggable

  self.set_target_fields :period_year, :month_number
end
