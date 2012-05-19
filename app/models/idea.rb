class Idea < ActiveRecord::Base
  attr_accessible :addtional_info, :description, :title

  validates :title, :description, :presence => true
end
