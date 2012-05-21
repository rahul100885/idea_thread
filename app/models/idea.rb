class Idea < ActiveRecord::Base
  attr_accessible :addtional_info, :description, :title

  validates :title, :description, :presence => true

  belongs_to :user, :foreign_key => :created_by

  #TODO - If required will implement counter_cache for performace
  has_many :votes

end
