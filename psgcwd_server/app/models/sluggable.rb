module Sluggable
  extend ActiveSupport::Concern

  included do
    before_create :slugify
    class_attribute :target_fields
  end

  def slugify
    str = self.target_fields.reduce('') { |a, s| a + "-" + self[s].to_s } 
    self.slug = str.parameterize
  end

  # methods defined here are going to extend the class, not the instance of it
  module ClassMethods
    def set_target_fields(*fields)
      self.target_fields = fields
    end
  end
end

# [ ] %TODO - write unit test
# [ ] %TODO https://stackoverflow.com/questions/45445744/how-to-create-a-common-after-create-callback-for-all-models

# move to concern? - https://stackoverflow.com/questions/46422576/how-do-i-reference-model-attributes-in-module-instance-methods-in-ror-5

# https://stackoverflow.com/questions/35271911/set-class-variable-from-module
# https://stackoverflow.com/questions/15773552/ruby-class-instance-variable-vs-class-variable
# 
#  => http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
#  https://stackoverflow.com/questions/26517349/are-rails-module-instance-variables-available-to-other-classes
#  https://stackoverflow.com/questions/2567956/rails-class-self
# 
# 
#  => https://stackoverflow.com/questions/14541823/how-to-use-concerns-in-rails-4
