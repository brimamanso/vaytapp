class Createciens < ActiveRecord::Migration[5.1]
  def change
    create_table :ciens do |t|
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
    
    add_index :ciens, :sender_id
    add_index :ciens, :recipient_id
  end
end
