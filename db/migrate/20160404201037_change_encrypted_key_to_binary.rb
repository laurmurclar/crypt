class ChangeEncryptedKeyToBinary < ActiveRecord::Migration
  def change
    change_column :user_docs, :encrypted_key, :binary
  end
end
