class Peweight < ActiveRecord::Base
    validates_presence_of :expense, :person, :weight
    validates_uniqueness_of :person_id, :scope => :expense_id
    belongs_to :expense
    belongs_to :person

    def self.getPeWeight(personId, expenseId)
        #find the person-expense-weight for specific person and expense
        #if not in dB, it is one
        findresult=Peweight.find_by_person_id_and_expense_id(personId, expenseId)
        if findresult == nil 
            pew=1
        else
            pew=findresult.weight
        end
        pew
    end

end
