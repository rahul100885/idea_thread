class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  attr_accessible :vote

  validates :user_id, :idea_id, :presence => true 

  validates :idea_id, :uniqueness => { :scope => :user_id,
    :message => "You have already voted this idea" }
end
