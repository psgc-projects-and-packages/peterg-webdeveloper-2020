class Project < ApplicationRecord
  include Guidable
  include Sluggable

  belongs_to :startdate, class_name: :Monthperiod
  belongs_to :enddate, class_name: :Monthperiod

  def to_param  # overridden
    slug
  end

  self.set_target_fields :ptitle
end
