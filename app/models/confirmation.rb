class Confirmation < ActiveRecord::Base
  belongs_to :user
  belongs_to :reserve
  attr_accessor :card_number, :card_digits
  before_create :update_credit
  after_create :generate_credit, :mark_reserve_as_confirmed
  after_destroy :generate_extra_credit, :mark_reserve_as_unconfirmed
  validates_length_of :card_number, :is => 16, :if => :allow_validation
  validates_length_of :card_digits, :is => 3, :if => :allow_validation
  
  def extra_credits
    # Valor da reserva - 20 %
    (value * 0.8).to_i
  end
  
  protected
  
  def allow_validation
    self.credit_card?
  end
  
  def update_credit
    self.credits = 5
  end
  
  def generate_credit
    # Caso tenha sido pago em créditos credita a diferença
    if credit_card?
      user.increase_credit(credits)
    else
      user.decrease_credit(value.to_i - credits.to_i)
    end
  end
  
  def mark_reserve_as_confirmed
    reserve.update_attribute(:confirmed, true)
  end
  
  def mark_reserve_as_unconfirmed
    reserve.update_attribute(:confirmed, false)
  end
  
  def remove_credit
    user.decrease_credit(credits)
  end
  
  def generate_extra_credit
    user.increase_credit(extra_credits)
  end

end
