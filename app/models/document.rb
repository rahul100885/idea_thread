class Document < ActiveRecord::Base
  has_attached_file :data
  belongs_to :attachable, :polymorphic => true
  attr_accessible :data, :description, :name
end
