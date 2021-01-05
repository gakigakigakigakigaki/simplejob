class MessagesController < ApplicationController
  def new
    @messages = Message.all
    @message = Message.new
  end
  
  
  def create
    @job = Job.find(params[:job_id])
    @message = Message.new(text: params[:message][:text])
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
      @messages = Message.all
  end

  private
  def message_params
    if current_company
      params.require(:message).permit(:text, :user, :company, :job).merge(job_id: params[:job_id],company_id: current_company.id)
    else current_user
      params.require(:message).permit(:text, :user, :company, :job).merge(job_id: params[:job_id],user_id: current_user.id)
    end
  end

  
end
