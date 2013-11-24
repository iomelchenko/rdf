class StgSourceFields < ActiveRecord::Migration
  def change
    create_table :stg_source_fields do |t|
      t.string :name
      t.string :description
      t.string :date_type
      t.timestamps
    end
  end
end

