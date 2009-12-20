module ConfirmationHelper
  
  def user_credits(reserve)
    credits = number_to_currency(current_user.balance)
    if current_user.balance >= reserve.court.value
      content = "(Seus créditos: #{credits})"
    else
      content = "(Créditos Insuficientes: #{credits})"
    end
    content_tag :small, content
  end
  
end
