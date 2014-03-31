# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :username do |n|
    tmp = ""; while (tmp.length < 8) do 
      tmp+= Random.rand(127).chr; tmp.gsub!(/\W/,'')
    end
    tmp
  end
  
  sequence :email do |n|
    "user#{n}@example.com"
  end
  
  factory :user, :aliases => [:gamemaster] do
    username  { FactoryGirl.generate :username}
    email { FactoryGirl.generate :email }
    password { SecureRandom.hex(10) }
  end
end
