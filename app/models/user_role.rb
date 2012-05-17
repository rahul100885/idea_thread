class UserRole < ActiveRecord::Base
  belongs_to :users
  belongs_to :roles
  # attr_accessible :title, :body
end
