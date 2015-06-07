class Reaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :show

  scope :text,  -> { where(reaction_type: 'text') }

end