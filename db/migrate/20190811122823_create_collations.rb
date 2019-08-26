class CreateCollations < ActiveRecord::Migration[5.2]
  def change
    create_table :collations do |t|
      t.string :number1
      t.string :number2

      t.timestamps
    end
  end
end
