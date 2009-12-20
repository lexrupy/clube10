class Reserve < ActiveRecord::Base
  attr_accessible :court_id, :reserved_at, :reserve_time, :confirmed, :user, :points
  belongs_to :user
  belongs_to :court
  delegate :username, :to => :user
  delegate :name, :to => :court, :prefix => true
  delegate :value, :to => :court, :prefix => true
  
  has_one :confirmation
  
  named_scope :valid_reserves, :conditions => ['reserved_at > ?', 24.hours.from_now]
  
  def confirm
    return false if reserved_at > 24.hours.from_now
    self.confirmed = true
    self.save
  end
  
  #validates_uniqueness_of :court_id, :scope =>  [:reserved_at, :reserve_time], :on => :create, :message => "Esta quadra já encontra-se reservada para esta data e horário."
  def self.times_for_select
    options = (7.upto(21).to_a - [12]).inject([]) do |values, time|
      values << ["#{time.to_s.rjust(2,'0')}:00 - #{(time+1).to_s.rjust(2,'0')}:00"]
    end
  end
  
  private
  
  def validate
    if reserved_at.nil?
      errors.add(:reserved_at, 'A data da reserva não pode ficar em branco.') 
    elsif reserved_at < 2.days.from_now.to_date
      errors.add(:reserved_at, 'A reserva deve ser feita com pelo menos 3 dias de antecedência.')
    end
  end
end
