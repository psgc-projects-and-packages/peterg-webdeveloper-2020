require 'securerandom'

module Guidable
  extend ActiveSupport::Concern

  included do
    before_create :do_guid
  end

  def do_guid
    self.guid = SecureRandom.uuid if guid.blank?
  end
end

# [ ] %TODO https://stackoverflow.com/questions/45445744/how-to-create-a-common-after-create-callback-for-all-models
