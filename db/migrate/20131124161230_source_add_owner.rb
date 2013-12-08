class SourceAddOwner < ActiveRecord::Migration
  def change
    add_column :sources, :owner, :string
  end
end
