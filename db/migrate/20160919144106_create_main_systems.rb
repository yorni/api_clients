class CreateMainSystems < ActiveRecord::Migration
  def change
    create_table :main_systems do |t|
      t.datetime :period
      t.belongs_to :acc_system, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
