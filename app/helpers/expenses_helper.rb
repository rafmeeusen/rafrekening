module ExpensesHelper
  def new_expense_path(name)
    root_path + params[:secret] + "/expenses/" + name + "/new" 
  end
  def expense_path(id)
    root_path + params[:secret] + "/expenses/" + id.to_s
  end
end
