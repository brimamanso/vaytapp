class CreateMls < ActiveRecord::Migration[5.1]
  def change
    create_table :mls do |t|
      t.text :body
      t.references :tlk, index: true
      t.references :user, index: true
      t.boolean :read, :default => false
      t.timestamps
    end
  end
end
