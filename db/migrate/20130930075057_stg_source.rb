class StgSource < ActiveRecord::Migration
  def change
    create_table :stg_sources do |t|
      t.string :name
      t.string :description
      t.string :object_type
      t.timestamps
    end
  end
end
