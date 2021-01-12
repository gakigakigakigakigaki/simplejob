class LikesController < ApplicationController
  before_action :set_job

    def create
      user = current_user
        @job = Job.find(params[:job_id])
        @jobs = Job.all
        @like = Like.create(user_id: current_user.id, job_id: params[:job_id])
        @likes = Like.where(job_id: params[:job_id])
        @like.save
        @job = @like.job
    end
    def destroy
        user = current_user
        @job = Job.find(params[:job_id])
        @job = Job.all
        @likes = Like.where(job_id: params[:job_id])
        like = Like.find_by(user_id: current_user.id, job_id: params[:job_id])
        like.delete
    end

     private
    def set_job
        @job = Job.find(params[:job_id])
    end

  

end
