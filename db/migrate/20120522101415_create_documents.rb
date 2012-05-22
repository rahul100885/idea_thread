class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.references :attachable, :polymorphic => true
      t.has_attached_file :data

      t.timestamps
    end
    add_index :documents, :attachable_id
  end
end
