module Sluggable
  extend ActiveSupport::Concern

  @@target_fields = []

  included do
    before_create :slugify
  end

  def slugify
    str = @@target_fields.reduce('') { |a, s| a + "-" + self[s] } 
    self.slug = str.parameterize
  end

  def self.set_target_fields *fields 
    @@target_fields = fields
  end

end

# [ ] %TODO - write unit test
# [ ] %TODO https://stackoverflow.com/questions/45445744/how-to-create-a-common-after-create-callback-for-all-models

# move to concern? - https://stackoverflow.com/questions/46422576/how-do-i-reference-model-attributes-in-module-instance-methods-in-ror-5
