class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.boolean :anonimus, default: false
      t.string :comment, default: ''
      t.references :user, foreign_key: true
      t.references :aventure, foreign_key: true
      t.timestamps
    end
  end
end
