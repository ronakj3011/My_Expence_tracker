class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy]

  # Displays all expenses in descending order by date
  def index
    @expenses = Expence.order(date: :desc) 
  end

  # Displays the form for adding a new expense
  def add_expenses
    @expense = Expence.new # Creates a new empty expense object for the form
  end

  # Handles the creation of a new expense
  def create
    @expense = current_user.expences.new(expense_params)
    if @expense.save
      redirect_to user_dashboard_path, notice: "Expense added successfully."
    else
      render :add_expenses, alert: "Failed to add expense. Please check the details."
    end
  end

  def all_expenses
    @expense = Expence.order(date: :DESC)
  end


# Displays the dashboard with expense summaries
def dashboard
  current_month_range = Time.zone.now.beginning_of_month..Time.zone.now.end_of_month
  @user_name = current_user.name
  @total_expenses = Expence.sum(:amount) # Total expenses
  @current_month_expenses = Expence.where(date: current_month_range).sum(:amount) # Current month expenses
  @budget = current_user.budget || 0 # Get the budget or default to 0
  @remaining_budget = @budget - @total_expenses
  @recent_expenses = Expence.order(date: :desc).limit(3) # Recent expenses
end


  # Displays the form for editing an existing expense
  def edit
    # @expense is already set by before_action
  end

  # Handles updating an existing expense
  def update
    if @expense.update(expense_params)
      redirect_to user_dashboard_path, notice: "Expense updated successfully."
    else
      render :edit, alert: "Failed to update expense."
    end
  end

  # Handles deleting an existing expense
  def destroy
    @expense.destroy
    redirect_to user_dashboard_path, notice: "Expense deleted successfully."
  end

  def edit_budget
    @user = current_user
  end  

  def update_budget
    if current_user.update(budget_params)
      redirect_to user_dashboard_path, notice: "Budget updated successfully."
    else
      render :edit_budget, alert: "Failed to update budget."
    end
  end    

  private

  # Sets the expense object for edit, update, and destroy actions
  def set_expense
    @expense = Expence.find(params[:id])
  end

  # Whitelists the parameters for expense creation and update
  def expense_params
    params.require(:expence).permit(:date, :category, :amount, :description, :mode)
  end
  def budget_params
    params.require(:user).permit(:budget)
  end
  def calculate_remaining_budget
    budget = current_user.budget || 0 # Total budget (adjust as needed)
    expenses = Expence.sum(:amount).to_f # Ensure the result is a numeric value
    budget - expenses # Return the calculated remaining budget
  end
  
end
