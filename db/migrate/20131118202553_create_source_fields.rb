class CreateSourceFields < ActiveRecord::Migration
  def change
    create_table :source_fields do |t|
      t.string :name
      t.string :description
      t.string :date_type
      t.references :source
      t.timestamps
    end
  end
end

