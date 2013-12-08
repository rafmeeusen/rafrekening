require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
   test "positive case with/without description" do
     prj=Project.new(:secret=>"0123456789abcdef")
     prj.save
     person=Person.new(:project_id=>prj.id, :name=>"Raf")
     person.save
     e=Expense.new(:person_id=>person.id, :amount=>10.0)
     assert e.save
     e=Expense.new(:person_id=>person.id, :description=>"restaurant", :amount=>50.5)
     assert e.save
   end

   test "person must exist" do
     prj=Project.new(:secret=>"0123456789abcdef")
     prj.save
     person=Person.new(:project_id=>prj.id, :name=>"Raf")
     person.save
     e=Expense.new(:person_id=>(person.id+1), :amount=>10.0)
     assert !e.save
   end

   test "amount must be a number" do
     prj=Project.new(:secret=>"0123456789abcdef")
     prj.save
     person=Person.new(:project_id=>prj.id, :name=>"Raf")
     person.save
     e=Expense.new(:person_id=>person.id, :amount=>"ten")
     assert !e.save
   end

   test "getUnits must return 1 in project of one person and two expenses" do
     prj=Project.new(:secret=>"0123456789abcdef")
     prj.save
     person=Person.new(:project_id=>prj.id, :name=>"Raf")
     person.save
     e1=Expense.new(:person_id=>person.id, :amount=>10.0)
     e1.save
     e2=Expense.new(:person_id=>person.id, :amount=>10.0)
     e2.save
     assert (e1.getUnits == 1)
     assert (e2.getUnits == 1)
   end
   
   test "getUnits must return 3 in project with three persons and one expense" do
     prj=Project.new(:secret=>"0123456789abcdef")
     prj.save
     person=Person.new(:project_id=>prj.id, :name=>"Raf")
     person.save
     person=Person.new(:project_id=>prj.id, :name=>"Jan")
     person.save
     person=Person.new(:project_id=>prj.id, :name=>"Mat")
     person.save
     e=Expense.new(:person_id=>person.id, :amount=>10.0)
     e.save
     assert (e.getUnits == 3)
   end   

end
