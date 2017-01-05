class CreateDocTypes < ActiveRecord::Migration
  def change
    create_table :doc_types do |t|
      t.string :name, limit: 20

      t.timestamps null: false
    end
  end
end
