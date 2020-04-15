module Sluggable
  extend ActiveSupport::Concern

  @@target_fields = []

  def self.set_target_fields field1 
    @@target_fields << field1
  end

  included do
    before_create :slugify
  end

  def slugify
    #byebug
    self.slug = self[@@target_fields[0]].parameterize
  end
end

# [ ] %TODO https://stackoverflow.com/questions/45445744/how-to-create-a-common-after-create-callback-for-all-models

# move to concern? - https://stackoverflow.com/questions/46422576/how-do-i-reference-model-attributes-in-module-instance-methods-in-ror-5
