class Project < ApplicationRecord
  include Guidable

  belongs_to :startdate, class_name: :Monthperiod
  belongs_to :enddate, class_name: :Monthperiod
end
