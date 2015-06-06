class Show < ActiveRecord::Base
  has_many :reactions
  def recommend
    return Show.first 
  end
end
