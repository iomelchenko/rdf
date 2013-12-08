class SourceField < ActiveRecord::Base
  attr_accessible :description, :name, :date_type, :source_id
  belongs_to :source

  validates :name, presence: true

end