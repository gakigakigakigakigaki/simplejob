class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
  end
  
  
  def create
    @job = Job.find(params[:job_id])
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
      # redirect_to job_path(@message.job)
    else
      @job = @message.job
      @messages = @job.messages
      
      
      
    end
  end
    def show
      @job = Job.find(params[:job_id])
      @user = User.find(params[:id])
      @company = Company.find(params[:id])
      @messages = Message.all
  end

  private
  def message_params
    if user_signed_in?
      params.require(:message).permit(:text, :user, :company).merge(user_id: current_user.id, job_id: params[:job_id])
    else company_signed_in?
      params.require(:message).permit(:text, :user, :company).merge(company_id: current_company.id, job_id: params[:job_id])

    end
  end

  
end
