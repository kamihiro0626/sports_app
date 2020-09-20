class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text,                           null: false
      t.references :user, foreign_key: true,  null: false
      t.references :post, foreign_key: true, null: false
      t.integer :delete_check, default: 0

      t.timestamps
    end
  end
end
