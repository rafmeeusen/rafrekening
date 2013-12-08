require 'test_helper'

class PersonTest < ActiveSupport::TestCase
   test "add new person with/without given weight" do
     prj=Project.new(:secret=>"0123456789abcdef")
     prj.save
     p=Person.new(:project_id=>prj.id,:name=>"Raf",:pweight=>1) 
     assert p.save
     p=Person.new(:project_id=>prj.id,:name=>"Jan")
     assert p.save     
   end

   test "default weight must be one" do
     prj=Project.new(:secret=>"0123456789abcdef")
     prj.save
     p=Person.new(:project_id=>prj.id,:name=>"Jan")
     p.save
     assert (p.pweight==1) 
   end

   test "person must have existing project-id " do
     prj=Project.new(:secret=>"0123456789abcdef")
     prj.save
     p=Person.new(:name=>"Jan")
     assert !p.save
     p=Person.new(:project_id=>(prj.id+1),:name=>"Jan")
     assert !p.save
     #finally positive case to double-check:
     p=Person.new(:project_id=>(prj.id),:name=>"Jan")
     assert p.save
   end

   test "person must have name" do
     prj=Project.new(:secret=>"0123456789abcdef")
     prj.save   
     p=Person.new(:project_id=>prj.id,:name=>"")
     assert !p.save
   end

   test "name must be unique in project, but can be reused in other project" do
     prj1=Project.new(:secret=>"0123456789abcdef")
     prj1.save
     prj2=Project.new(:secret=>"0123456789abcdez")
     prj2.save

     p=Person.new(:project_id=>prj1.id,:name=>"Jan")
     assert p.save   
     p=Person.new(:project_id=>prj1.id,:name=>"Jan")
     assert !p.save 
     p=Person.new(:project_id=>prj2.id,:name=>"Jan")
     assert p.save 
   end
   
   test "totalAmount and amountToPay must be zero(0) after creating person" do
     prj=Project.new(:secret=>"0123456789abcdef")
     prj.save
     p=Person.new(:project_id=>prj.id,:name=>"Jan")
     p.save
     assert (p.totalAmount == 0)
     assert (p.amountToPay == 0)
   end

end
