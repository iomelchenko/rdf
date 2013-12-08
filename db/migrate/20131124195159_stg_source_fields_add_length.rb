class StgSourceFieldsAddLength < ActiveRecord::Migration
  def change
    add_column :stg_source_fields, :data_length, :string
    add_column :stg_source_fields, :data_precigion, :string
    add_column :stg_source_fields, :data_scale, :string        
  end
end
