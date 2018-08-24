class TicketsController < ApplicationController
  before_action :set_ticket, only: [:edit, :update, :destroy, :asssign_edit, :assign_update]
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  # might not need new since I want to create a new ticket on the index page.
  # would need to give index a ticket.new
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.student = current_user
    if @ticket.save!
      redirect_to tickets_path, notice: "Ticket Successfully Created."
    else
      render :new, alert: "Could not save ticket properly."
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to tickets_path, notice: "Successfully updated"
    else
      render :edit, alert: "Could not update ticket."
    end
  end

  def destroy
    if @ticket.status == "pending"
      @ticket.destroy
      redirect_to tickets_path
    end
  end

  def assign_edit
  end

  def assign_update
    # need to allow only for ta: true
    @ticket.ta = current_user
    if @ticket.save!
      redirect_to tickets_path, notice: "Ticket was assigned to you!"
    else
      redirect_to tickets_path, alert: "Something went wrong"
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:question, :ta_id)
  end
end
