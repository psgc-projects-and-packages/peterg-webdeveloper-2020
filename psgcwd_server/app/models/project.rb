class Project < ApplicationRecord
  include Guidable
  include Sluggable

  belongs_to :startdate, class_name: :Monthperiod
  belongs_to :enddate, class_name: :Monthperiod

  Sluggable.set_target_fields :ptitle
  #Sluggable.set_target_fields :ptitle, :client

#  before_create do
#    self.slug = ptitle.parameterize
#  end
end
