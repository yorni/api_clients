class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, limit: 150
      t.string :first_name, limit: 40
      t.string :second_name, limit: 40
      t.string :middle_name, limit: 40
      t.string :cellphone, limit: 12
      t.string :okpo, limit: 10
      t.string :inn, limit: 10
      t.belongs_to :client_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
