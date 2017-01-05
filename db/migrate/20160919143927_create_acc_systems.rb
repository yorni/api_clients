class CreateAccSystems < ActiveRecord::Migration
  def change
    create_table :acc_systems do |t|
      t.string :name, limit: 30

      t.timestamps null: false
    end
  end
end
