class MessagesController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @message = Message.new(message_params)
    if @message.save
      redirect_to job_path(@messages.job)
    else
      @job = @message.job
      @messages = @job.messages
      
      
      
    end
  end
    def show
      @job = Job.find(params[:job_id])
      @user = User.find(params[:id])
      @messages = Message.all
  end

  private
  def message_params
    params.require(:message).permit(:text, :user, :company, :job).merge(user_id: current_user.id, company_id: current_company.id)
  end

  
end
