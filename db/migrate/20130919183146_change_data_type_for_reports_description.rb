class ChangeDataTypeForReportsDescription < ActiveRecord::Migration
  def up
    change_table :reports do |t|
      t.change :description, :string
    end  	
  end

  def down
    change_table :reports do |t|
      t.change :description, :text
    end  	
  end
end

