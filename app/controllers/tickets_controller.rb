# rubocop:disable LineLength
class TicketsController < ApplicationController
  
  before_action :find_ticket, only: [:show, :edit, :update, :destroy]
  
  def index
    @tickets = Ticket.all.order("name")
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render 'edit'
    end
  end

  def destroy
    @ticket.destroy
    redirect_to root_path
  end

  private

  def find_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description, :code, :price, :stock_quantity, :status)
  end
end
