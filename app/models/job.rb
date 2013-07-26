class Job < ActiveRecord::Base
  belongs_to :circle
  belongs_to :killer, class_name: "Player"
  belongs_to :victim, class_name: "Player"
  
  
  def self.generate_key
    tmp = ""; while (tmp.length < 12) do 
      tmp+= Random.rand(127).chr; tmp.gsub!(/\W/,'')
    end
    return tmp
  end
  
end
