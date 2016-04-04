class CreateUserDocs < ActiveRecord::Migration
  def change
    create_table :user_docs do |t|
      t.references :user, null: false
      t.references :edoc, null: false
      t.string :encrypted_key, null: false

      t.timestamps null: false
    end
  end
end
