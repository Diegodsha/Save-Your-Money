class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]
  before_action :authenticate

  # GET /expenses or /expenses.json
  def index
    @expenses = Expense.includes(groups: [icon_attachment: :blob]).where('author_id = ?',
                                                                         current_user.id).joins(:groups_expenses)
  end

  def expense_ungrouped
    @expenses = Expense.includes(groups: [icon_attachment: :blob]).where('author_id = ?',
                                                                         current_user.id).left_outer_joins(:groups_expenses).where('group_id IS NULL')
    render 'index'
  end

  # GET /expenses/1 or /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses or /expenses.json
  def create
    @expense = Expense.new(expense_params)
    @expense.author_id = current_user.id

    respond_to do |format|
      if @expense.save
        # p params[:expense][:group_id]
        group_id = params[:expense][:group_id]
        GroupsExpense.create(group_id: group_id, expense_id: @expense.id) if group_id

        format.html { redirect_to expenses_path, notice: 'Expense added.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def authenticate
    return if logged_in?

    flash[:alert] = 'You need to login or sign up to access'
    redirect_to '/log'
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
