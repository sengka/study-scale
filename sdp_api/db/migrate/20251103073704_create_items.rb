class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.references :scale, null: false, foreign_key: true
      t.string :text
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
