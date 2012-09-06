class TodayVideosController < ApplicationController
  layout "admin"
  # GET /today_videos
  # GET /today_videos.json
  def index
  
    @videos = Video.where(:video_type => 2).order("id DESC")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /today_videos/1
  # GET /today_videos/1.json
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /today_videos/new
  # GET /today_videos/new.json
  def new
    @channel = params[:forminfo]
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /today_videos/1/edit
  def edit
    @channel = params[:forminfo]
    @video = Video.find(params[:id])
  end

  # POST /today_videos
  # POST /today_videos.json
  def create
    @video = Video.new(params[:video])
    video_file = params[:video_file]
    img_file = params[:img_file]

    if video_file != nil
      videoid = Utils.videoid
      @video.video_url = "http://10.10.140.70:5000/files/"+Utils.upload(video_file, videoid)
      @video.video_id = videoid
    end
    if img_file != nil
      @video.video_img ="http://10.10.140.70:5000/files/"+Utils.upload(img_file, nil)
    end

    respond_to do |format|
      if @video.save
        format.html { redirect_to today_videos_path }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /today_videos/1
  # PUT /today_videos/1.json
  def update
    @video = Video.find(params[:id])
    video_file = params[:video_file]
    img_file = params[:img_file]

    if video_file != nil
      videoid = Utils.videoid
      @video.video_url = "http://10.10.140.70:5000/files/"+Utils.upload(video_file, videoid)
    end

    if img_file != nil
      @video.video_img ="http://10.10.140.70:5000/files/"+Utils.upload(img_file, nil)
    end
    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to today_videos_path }
      else
        format.html { render action: "new" }
      end
    end
  end

  # DELETE /today_videos/1
  # DELETE /today_videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to today_videos_url }
      format.json { head :no_content }
    end
  end


  def using
    @channel = params[:forminfo]
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to :action => "index",:forminfo => @channel
  end
end
