class AddDocToEdocs < ActiveRecord::Migration
  def change
    add_column :edocs, :doc, :string
  end
end
