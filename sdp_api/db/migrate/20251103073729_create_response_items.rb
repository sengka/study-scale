class CreateResponseItems < ActiveRecord::Migration[8.0]
  def change
    create_table :response_items do |t|
      t.references :response, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
