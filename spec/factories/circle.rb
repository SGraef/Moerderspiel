FactoryGirl.define do
  sequence :number do |n|
    n
  end
  
  factory :circle do
    number {FactoryGirl.generate :number}
  end
  
  factory :circle_with_done_job, parent: :job do
    after_create { |circle| Factory(:job, circle: circle)}
  end
end
