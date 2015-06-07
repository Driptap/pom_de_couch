class Swipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :show
  STATES = %w[dislike like watched watching]

  scope :watching,  -> { where(state: 'watching') }
  scope :watched,  -> { where(state: 'watched') }
  scope :dislike,  -> { where(state: 'dislike') }
  scope :like,  -> { where(state: 'like') }

end
