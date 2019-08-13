class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def require
  	add_index :users, :email, unique: true
  end
end
