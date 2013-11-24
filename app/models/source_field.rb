class SourceField < ActiveRecord::Base
  attr_accessible :description, :name, :date_type
  belongs_to :source

  validates :name, presence: true, uniqueness: true

end