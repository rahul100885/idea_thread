class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :idea
      t.boolean :vote

      t.timestamps
    end
    add_index :votes, :user_id
    add_index :votes, :idea_id
  end
end
