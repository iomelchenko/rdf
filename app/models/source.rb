class Source < ActiveRecord::Base
  attr_accessible :description, :name, :object_type
  belongs_to :report
  has_many :source_fields
  validates :name, presence: true, uniqueness: true

end
