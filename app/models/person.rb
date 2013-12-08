class Person < ActiveRecord::Base
    validates_presence_of :name, :project
    validates_uniqueness_of :name, :scope => :project_id 
    belongs_to :project 
    has_many :expenses, :dependent=>:destroy

    def totalAmount #amount already payed by this person
        # this probably can be written shorter by smbdy who knows ruby: 
        total=0 
        expenses.each do |exp|
            total+=exp.amount
        end 
        total
    end

    def amountToPay
        #loop over all project expenses, and sum this person's contribution 
        #depending on weights and expense-units
        total=0 
        project.expenses.each do |exp|
            peweight=Peweight.getPeWeight(id,exp.id)
            total+=(pweight * peweight * exp.amount / exp.getUnits)
        end
        total
    end
    def saldo
      amountToPay-totalAmount
    end
end
