class User < ActiveRecord::Base
  has_many :swipes
  has_many :reactions

  def watched_shows 
    self.swipes.where(state: "watched")
  end
end