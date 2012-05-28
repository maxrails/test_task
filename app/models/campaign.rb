class Campaign < ActiveRecord::Base
  attr_accessible :address, :regions, :end_timezone, :ended_at, :languages, :name, :phone, :start_timezone, :started_at, :brend_id

  serialize :regions
  serialize :languages

  belongs_to :brend

  validates :end_timezone, :presence=>true
  validates :start_timezone, :presence=>true
  validates :started_at, :presence=>true
  validates :ended_at, :presence=>true
  validates :languages, :presence=>true
  validates :regions, :presence=>true
  validates :brend_id, :presence=>true

  validate :start_end_time_valid

  delegate :name, :to => :brend

  # this only for dev. - in the server time will be in UTC
  def self.set_correct_time(time_string)
    date_time = Time.strptime(time_string,'%m/%d/%Y %H:%M') rescue nil
    date_time + (Time.zone_offset("#{Time.now.zone}")/3600).hours
  end

  def company_name
    brend.company.name
  end


  def start_end_time_valid
    errors[:started_at] << " time must be earlier then end time" if started_at.present? && ended_at.present? && started_at.to_i >= ended_at.to_i
  end


end
