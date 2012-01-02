class Payment

  attr_accessor :from, :to, :amount 
 
  def initialize(from, to, amount)
    @from   = from 
    @to     = to  
    @amount = amount 
  end

end
