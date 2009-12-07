class Confirmation < ActiveRecord::Base
  belongs_to :user
  belongs_to :reserve
  attr_accessor :credit_card_number
  after_create :generate_credit
  
  protected
  
  def generate_credit
    user.increase_credit(5)
  end

end
