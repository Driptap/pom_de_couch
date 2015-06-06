class Show < ActiveRecord::Base
  def recommend
    return Show.first 
  end
end
