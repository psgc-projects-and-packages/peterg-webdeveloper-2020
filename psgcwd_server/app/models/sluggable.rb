module Sluggable
  extend ActiveSupport::Concern

  #@@target_fields = []

  included do
    before_create :slugify
    class_attribute :target_fields
  end

  #def self.included(base)
  #  base.extend ClassMethods
  #end

  def slugify
    #str = @@target_fields.reduce('') { |a, s| a + "-" + self[s].to_s } 
    str = self.target_fields.reduce('') { |a, s| a + "-" + self[s].to_s } 
    self.slug = str.parameterize
  end

  #def self.set_target_fields *fields 
  #@@target_fields = fields
  #Sluggable.target_fields = fields
  #end

  module ClassMethods
    #attr_accessor :target_fields
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
