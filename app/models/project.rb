class Project < ActiveRecord::Base
    validates_format_of :secret, :with => /\A([a-z0-9]){16}\Z/
    validates_uniqueness_of :secret 
    has_many :people, :dependent=>:destroy
    has_many :expenses, :through=>:people
    after_initialize :auto_secret

    def auto_secret
      if !self.secret
        # create valid secret that is guaranteed to not exist yet
        allowedChars=('a'..'z').to_a + ('0'..'9').to_a
        begin
          newsecret = (1..16).map{ allowedChars[SecureRandom.random_number(allowedChars.length)] }.join
        end until !Project.find_by_secret(newsecret)
        self.secret = newsecret 
      end
    end

    def totalAmount
    # this probably can be written shorter by smbdy who knows ruby:
        total=0
        people.each do |person|
            total+=person.totalAmount 
        end 
        total
    end

    def getPayments
      payments=[]
      #make hash with person_id#saldo
        ids=people.map{|person| person.id}
        sds=people.map{|person| person.saldo}
      saldos=Hash[ids.zip sds]
      #create payments as long as needed    
      while ! allPaymentsDone(saldos)
        payments<<nextPayment(saldos)
      end
      payments
    end

# ---------CORE OF PAYMENT CALC + SOME HELPER METHODS---------------
  def allPaymentsDone(h)
    if h.empty?
       true
    else
      !(getMaxValue(h) > 0.001)
    end
  end
  def nextPayment(h) #h is hash with ids/saldos
    # principle: biggest payer pays to biggest receiver
    # payer values are +, receiver values are -
    payerID=getKeyOfMaxValue(h)
    receiverID=getKeyOfMinValue(h)
    amount=[getMaxValue(h).abs, getMinValue(h).abs].min   
    h[payerID] -= amount
    h[receiverID] += amount
    from=people.find(payerID).name
    to=people.find(receiverID).name
    Payment.new(from,to,amount)
  end

  def getMaxValue(h)
     h.max_by {|k,v| v}[1]
  end
  def getMinValue(h)
     h.min_by {|k,v| v}[1]
  end
  def getKeyOfMaxValue(h)
     h.max_by {|k,v| v}[0]
  end
  def getKeyOfMinValue(h)
     h.min_by {|k,v| v}[0]
  end
end
