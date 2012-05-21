class Idea < ActiveRecord::Base
  attr_accessible :addtional_info, :description, :title

  validates :title, :description, :presence => true

  belongs_to :user, :foreign_key => :created_by

  has_many :votes
end
