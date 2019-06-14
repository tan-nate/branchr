class CreateMashes < ActiveRecord::Migration
  def change
    create_table :mashes do |t|
      t.string :name
      t.integer :category_id
      t.integer :user_id
      t.references :whole, index: true
    end
  end
end
