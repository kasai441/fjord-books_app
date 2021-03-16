class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.text :content
      t.bigint  :writable_id
      t.string  :writable_type

      t.timestamps
    end
    add_index :comments, [:writable_type, :writable_id]
  end
end
