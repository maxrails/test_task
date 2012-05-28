class Brend < ActiveRecord::Base
  attr_accessible :company_id, :name

  belongs_to :company
  has_many :campaigns, :dependent => :destroy

  validates :name, :uniqueness => true, :presence => true
  validates :company_id, :presence => true
end
