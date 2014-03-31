FactoryGirl.define do
   factory :game do
    gamemaster {FactoryGirl.create :user}
    circles {create_list(:circle, 2)}
    name  { FactoryGirl.generate :username }
  end
end
