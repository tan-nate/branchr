class CreateMashes < ActiveRecord::Migration
  def change
    create_table :mashes do |t|
      t.string :name
      t.string :half1
      t.string :half2
      t.integer :category_id
      t.integer :user_id
    end
  end
end
