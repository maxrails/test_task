class Company < ActiveRecord::Base
  attr_accessible :address, :name, :phone

  has_many :brends, :dependent => :destroy

  has_many :campaigns, :through=>:brends

  validates :address, :presence => true
  validates :name, :presence => true, :uniqueness => true
  validates :phone, :presence => true
end
