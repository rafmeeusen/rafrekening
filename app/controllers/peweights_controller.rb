class PeweightsController < ApplicationController
  include PeopleHelper
  def create
    expenseid=params[:expense_id]
    personid=params[:person]
    weight=params[:weight]
    name = Expense.find(expenseid).person.name
    pew=Peweight.new(:person_id=>personid, :expense_id=>expenseid, :weight=>0).save 
    redirect_to person_path(name) 
  end

  def destroy
    pewid=params[:pew_id]
    pew=Peweight.find(pewid) 
    expense=pew.expense
    name = expense.person.name
    Peweight.find(pewid).destroy 
    redirect_to person_path(name)
  end

end

