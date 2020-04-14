require 'date'

# https://stackoverflow.com/questions/32127971/regenerate-yaml-fixtures-from-db-in-rails
namespace 'db:fixtures' do
  task :monthperiod => :environment do
    hash = {}
    File.open("#{Rails.root}/test/fixtures/monthperiods.yml", 'w') do |file|
      data = Monthperiod.all.to_a.map(&:attributes)
      iter = 1
      data.each do |d|
        d.delete('id')
        hash[iter] = d
        iter += 1
      end
      file.write hash.to_yaml
    end
  end
end
