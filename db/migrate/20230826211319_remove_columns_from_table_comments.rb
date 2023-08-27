class RemoveColumnsFromTableComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :likes_count, :integer
    remove_column :comments, :dislikes_count, :integer
  end
end
