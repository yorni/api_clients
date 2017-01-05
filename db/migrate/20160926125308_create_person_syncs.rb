class CreatePersonSyncs < ActiveRecord::Migration
  def change
    create_table :person_syncs do |t|
      t.belongs_to :person, index: true, foreign_key: true
      t.datetime :time_stamp

      t.timestamps null: false
    end
  end
end
