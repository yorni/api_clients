class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, limit: 150
      t.string :first_name, limit: 40
      t.string :second_name, limit: 40
      t.string :last_name, limit: 40
      t.string :cellphone, limit: 12
      t.string :inn, limit: 10

      t.timestamps null: false
    end
  end
end
