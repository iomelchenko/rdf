class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :description
      t.string :object_type
      t.references :report
      t.timestamps
    end
  end
end
