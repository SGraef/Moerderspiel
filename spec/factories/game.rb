FactoryGirl.define do
  sequence :gamename do |n|
    tmp = ""; while (tmp.length < 8) do 
      tmp+= Random.rand(127).chr; tmp.gsub!(/\W/,'')
    end
    tmp
  end
  
   factory :game do
    gamemaster {FactoryGirl.create :user}
    circles {create_list(:circle, 2)}
    name  { FactoryGirl.generate :gamename }
  end
  
  factory :game_with_user, parent: :game do
    player {create_list(:player, 5)}
  end
  
end
