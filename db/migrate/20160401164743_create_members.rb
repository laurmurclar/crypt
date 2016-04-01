class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :group
      t.references :user
      t.string :role
      
      t.timestamps null: false
    end
  end
end
