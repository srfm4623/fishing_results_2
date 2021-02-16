class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|

      t.integer :first_length
      t.integer :second_length
      t.integer :first_weight
      t.integer :second_weight
      t.string :area
      t.string :means
      t.text :text
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
