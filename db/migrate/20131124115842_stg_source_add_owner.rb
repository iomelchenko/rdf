class StgSourceAddOwner < ActiveRecord::Migration
  def change
    add_column :stg_sources, :owner, :string
  end
end
