class CreateEdocs < ActiveRecord::Migration
  def change
    create_table :edocs do |t|
      t.string :name, null: false
      t.references :group, null: false

      t.timestamps null: false
    end
  end
end
