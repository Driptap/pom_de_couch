class Swipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  STATES = %w[dislike like watched]

  scope :watched, -> { where(state: "watched") }
end
