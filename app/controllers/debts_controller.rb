class DebtsController < ApplicationController
  before_action :set_debt, only: [:show, :update, :destroy]

  # GET /debts
  # GET /debts.json
  def index
    @debts = Debt.all

    render json: @debts
  end

  # GET /debts/1
  # GET /debts/1.json
  def show
    render json: @debt
  end

  # POST /debts
  # POST /debts.json
  def create
    @debt = Debt.new(debt_params)

    if @debt.save
      render json: @debt, status: :created, location: @debt
    else
      render json: @debt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /debts/1
  # PATCH/PUT /debts/1.json
  def update
    @debt = Debt.find(params[:id])

    if @debt.update(debt_params)
      head :no_content
    else
      render json: @debt.errors, status: :unprocessable_entity
    end
  end

  # DELETE /debts/1
  # DELETE /debts/1.json
  def destroy
    @debt.destroy

    head :no_content
  end

  private

    def set_debt
      @debt = Debt.find(params[:id])
    end

    def debt_params
      params.require(:debt).permit(:customer_id, :payment_id, :billed_date, :cost, :taxes, :status)
    end
end
