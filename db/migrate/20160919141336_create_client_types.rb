class CreateClientTypes < ActiveRecord::Migration
  def change
    create_table :client_types do |t|
      t.string :name, limit: 30

      t.timestamps null: false
    end
  end
end
