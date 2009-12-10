module ReservesHelper
  
  def court_value(court)
    c = Court.find_by_id(court) || Court.first
    if c
      number_to_currency c.value
    else
      number_to_currency 0
    end
  end
  
end
