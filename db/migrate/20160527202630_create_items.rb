class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :grams
      t.boolean :owned, default: false, null: false

      t.timestamps
    end
  end
end
