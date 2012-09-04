class DialogsController < ApplicationController

  def window
    @id = params[:id]
  end

  def modify
    @video = Video.find(params[:id])
    @video.update_attributes(:video_type=>params[:video_type])
    render :nothing => true
  end

end
