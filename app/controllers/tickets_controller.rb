class TicketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_ticket, only: [:edit, :update, :destroy, :asssign_edit, :assign_update, :status_checker, :status_solved]
  after_action :status_checker, only: [:create, :update, :assign_update]
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @tickets = policy_scope(Ticket).where(status: "pending").or(Ticket.where(status: "assigned")).order(created_at: :desc)
  end

  def new
    @ticket = Ticket.new
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.student = current_user
    authorize @ticket
    if @ticket.save!
      redirect_to tickets_path, notice: "Ticket Successfully Created."
    else
      render :new, alert: "Could not save ticket properly."
    end
  end

  def edit
    # authorize @ticket
  end

  def update
    authorize @ticket
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
    # authorize @ticket
  end

  def assign_update
    # need to allow only for ta: true
    @ticket.ta = current_user
    authorize @ticket
    if @ticket.save!
      redirect_to tickets_path, notice: "Ticket was assigned to you!"
    else
      redirect_to tickets_path, alert: "Something went wrong"
    end
  end

  def status_checker
    if !@ticket.ta.nil?
      @ticket.status = "assigned"
      # authorize @ticket
      @ticket.save!
    end
  end

  def status_solved
    @ticket.status = "solved"
    # authorize @ticket
    if @ticket.save!
      redirect_to tickets_path, notice: "Good Job Ticket was solved!"
    else
      redirect_to tickets_path, alert: "Something went wrong"
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  def ticket_params
    params.require(:ticket).permit(:question, :ta_id)
  end
end
