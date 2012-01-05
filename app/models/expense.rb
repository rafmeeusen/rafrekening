class Expense < ActiveRecord::Base
  validates_numericality_of :amount
  validates_presence_of :person
  belongs_to :person
  has_many :peweights, :dependent=>:destroy
    
  def getUnits
    # weighted sum of participant weights
    # each person has a pweight (always exists)
    # but not each person has a peweight for this expense, can be nil
    units=0
    person.project.people.each do |person|
      peweight=Peweight.getPeWeight(person.id,id)
      units+=(peweight*person.pweight)
    end
    units
  end

  def getContributers
    contributers=[]
    person.project.people.each do |person|
      pew=Peweight.getPeWeight(person.id,id)
      if pew != 0
        contributers << {:person=>person, :weight=>pew}
      end 
    end
    contributers
  end

  def getNonContributers
    noncontributers=[]
        person.project.people.each do |person|
      pew=Peweight.getPeWeight(person.id,id)
      if pew == 0
        noncontributers << {:person=>person, :weight=>pew}
      end
    end
    noncontributers
  end

end
