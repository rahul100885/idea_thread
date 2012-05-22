class Idea < ActiveRecord::Base
  attr_accessible :addtional_info, :description, :title

  validates :title, :description, :presence => true

  belongs_to :user, :foreign_key => :created_by

  #TODO - If required will implement counter_cache for performance
  has_many :votes

  acts_as_commentable

  has_paper_trail
end
