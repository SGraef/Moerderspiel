FactoryGirl.define do
  sequence :number do |n|
    n
  end
  
  factory :circle do
    number {FactoryGirl.generate :number}
  end
end
