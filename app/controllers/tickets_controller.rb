# rubocop:disable LineLength
class TicketsController < ApplicationController
  before_action :find_ticket, only: %i(show edit update destroy)
  before_action :authenticate_user!, except: %i(index show search)

  def search
    @tickets = if params[:simple_search].present?
                 Ticket.search(params[:simple_search])
               else
                 Ticket.all
               end
  end

  def index
    @tickets = Ticket.all.order('name').page(params[:page]).per(5)
  end

  def show() end

  def new
    @ticket = current_user.tickets.build
    @categories = Category.all
  end

  def create
    @ticket = current_user.tickets.build(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all
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
    params.require(:ticket).permit(:name, :description, :image, :code, :price, :stock_quantity, :status, :category_id)
  end
end
