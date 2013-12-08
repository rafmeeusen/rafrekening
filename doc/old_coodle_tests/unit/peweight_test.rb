require 'test_helper'

class PeweightTest < ActiveSupport::TestCase
   def pewTestInit 
     prj=Project.new(:secret=>"0123456789abcdef")
     prj.save
     @p1=Person.new(:project_id=>prj.id, :name=>"Raf")
     @p1.save
     @p2=Person.new(:project_id=>prj.id, :name=>"Jan")
     @p2.save
     @e=Expense.new(:person_id=>@p1.id, :amount=>10.0)
     @e.save 
   end

   test "positive test" do
     pewTestInit()
     pew=Peweight.new(:person_id=>@p2.id, :expense_id=>@e.id, :weight=>3.0)
     assert pew.save
   end
   test "person must exist" do
     pewTestInit()
     pew=Peweight.new(:person_id=>9, :expense_id=>@e.id, :weight=>3.0)
     assert !pew.save
   end
   test "expense must exist" do
     pewTestInit()
     pew=Peweight.new(:person_id=>@p2.id, :expense_id=>(@e.id+7), :weight=>3.0)
     assert !pew.save
   end
   test "weight must be given " do
     pewTestInit()
     pew=Peweight.new(:person_id=>@p2.id, :expense_id=>@e.id)
     assert !pew.save
   end
   test "specific combination of person-expense can only be given once" do
     pewTestInit()
     pew=Peweight.new(:person_id=>@p2.id, :expense_id=>@e.id, :weight=>3.0)
     assert pew.save
     pew=Peweight.new(:person_id=>@p2.id, :expense_id=>@e.id, :weight=>7.0)
     assert !pew.save
   end
   test "after destroying peweight, the person-expense combination can be used again" do
     pewTestInit()
     pew=Peweight.new(:person_id=>@p2.id, :expense_id=>@e.id, :weight=>3.0)
     assert pew.save
     pew.destroy
     pew=Peweight.new(:person_id=>@p2.id, :expense_id=>@e.id, :weight=>7.0)
     assert pew.save
   end
   test "getPeWeight returns the right value" do
     pewTestInit()
     pew=Peweight.new(:person_id=>@p2.id, :expense_id=>@e.id, :weight=>3.0)
     assert pew.save
     assert (Peweight.getPeWeight(@p2.id, @e.id) == 3)
     pew=Peweight.new(:person_id=>@p1.id, :expense_id=>@e.id, :weight=>1.5)
     pew.save
     assert (Peweight.getPeWeight(@p1.id,@e.id) == 1.5)
   end
end
