module SetPassword
  attr_reader :password
  def password=(new_password)
    @password = new_password
    puts <<~EOS
    Setting password to: #{@password} (id: #{@password.__id__}).
    Object: #{self.class.name} (#{self.__id__}).
    Method: #{__callee__} on #{self.method(__callee__).__id__}.
    EOS
  end 
end

class User
  include SetPassword
end

class Foo
  include SetPassword
end

u1 = User.new; u1.password = 'abcdef'
u2 = User.new; u2.password = '123456'

f1 = Foo.new; f1.password = 'foobar'
f2 = Foo.new; f2.password = '838338'
