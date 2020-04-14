require 'securerandom'

class Project < ApplicationRecord
  before_create do
    self.guid = SecureRandom.uuid if guid.blank?
  end
end
