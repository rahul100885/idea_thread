class AddInfoToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :status, :string
    add_column :ideas, :created_by, :integer
    add_column :ideas, :updated_by, :integer
  end
end
