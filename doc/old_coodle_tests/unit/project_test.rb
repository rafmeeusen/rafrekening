require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

   test "project creation some positive tests" do
       prj = Project.new(:secret => "abcdefghijklmnop")
       assert prj.save
       prj = Project.new(:secret => "a1a2a3a4a5a6a7a8")
       assert prj.save
       prj = Project.new(:secret => "9999999999999999")
       assert prj.save
       prj = Project.new(:secret => "0q0q0q0q0q0q0q0q")
       assert prj.save
   end

   test "no capitals allowed in project secret" do
       prj = Project.new(:secret => "abcdefgHijklmnop")
       assert !prj.save
   end

   test "only alphanumerics allowed in project secret" do
       prj = Project.new(:secret => "abcdefg_ijklmnop")
       assert !prj.save
   end

   test "project secret must be 16 digits" do
       prj = Project.new()
       assert !prj.save
       prj = Project.new(:secret => "")
       assert !prj.save
       prj = Project.new(:secret => "abcdefghijklmno")
       assert !prj.save
       prj = Project.new(:secret => "abcdefghijklmnopq")
       assert !prj.save
   end

   test "project secret must be unique" do
       prj1 = Project.new(:secret => "0123456789abcdef")
       assert prj1.save
       prj2 = Project.new(:secret => "0123456789abcdef")
       assert !prj2.save
   end
   
   test "after destroying project, secret can be reused" do
       prj1 = Project.new(:secret => "0123456789abcdef")
       assert prj1.save
       prj1.destroy()
       prj2 = Project.new(:secret => "0123456789abcdef")
       assert prj2.save
   end
   
   test "total amount of new project is zero (0)" do
       prj = Project.new(:secret => "0123456789abcdef")
       assert prj.save
       assert (prj.totalAmount==0)
   end

end
