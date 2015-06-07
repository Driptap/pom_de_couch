class User < ActiveRecord::Base
  has_many :swipes
  has_many :reactions


end