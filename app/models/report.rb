class Report < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :sources, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
