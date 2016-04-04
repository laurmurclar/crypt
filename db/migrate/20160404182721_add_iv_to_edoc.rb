class AddIvToEdoc < ActiveRecord::Migration
  def change
    add_column :edocs, :iv, :string
  end
end
