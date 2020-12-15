class JobsController < ApplicationController
  
  def index
    @job = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
      if @job.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
    @job = Job.find(params[:id])
  end

  def destroy
  end


private
  def job_params
    params.require(:job).permit(:title, :jikyu, :number_of_people, :prefecture_id, :working_hours, :contents, :period, :image).merge( company_id: current_company.id)
  end

  


end