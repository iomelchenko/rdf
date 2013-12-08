class Source < ActiveRecord::Base
  attr_accessible :description, :name, :object_type, :owner
  belongs_to :report
  has_many :source_fields, dependent: :destroy

  validates :name, presence: true, uniqueness: true


end
