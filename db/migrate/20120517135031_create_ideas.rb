class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.text :addtional_info

      t.timestamps
    end
  end
end
