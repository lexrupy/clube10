class Reserve < ActiveRecord::Base
  attr_accessible :court, :reserved_at, :reserve_time, :confirmed, :user, :points
  belongs_to :user
  belongs_to :court
  delegate :username, :to => :user
  delegate :name, :to => :court, :prefix => true
  validates_uniqueness_of :court, :scope =>  [:reserved_at, :reserve_time], :on => :create, :message => "Esta quadra já encontra-se reservada para esta data e horário."

  def self.times_for_select
    options = (7.upto(21).to_a - [12] ).inject([]) do |values, time|
      values << ["#{time.to_s.rjust(2,'0')}:00 - #{(time+1).to_s.rjust(2,'0')}:00"]
    end
  end
  
  private
  
  def validate
    if reserved_at < 3.days.from_now.to_date
      errors.add(:reserved_at, 'A reserva deve ser feita com pelo menos 3 dias de antecedência')
    end
  end

end
