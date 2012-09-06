class SplendidVideosController < ApplicationController
  layout "admin"
  # GET /today_videos
  # GET /today_videos.json
  def index
    channel = params[:forminfo]
    @channels = Channel.all
    if channel != nil
      @forminfo = Video.new
      if channel['cid'] != nil
        @forminfo.cid = channel['cid']
        @channel = channel['cid']
      else
        @forminfo.cid = channel
        @channel = channel
      end
    else
      @channel = @channels[0].cid rescue 0
    end

    @videos = Video.where(:video_type => 3,:cid => @channel).order("id DESC")
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
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /today_videos/1/edit
  def edit
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
      @video.video_url = "http://localhost:3000/files/"+Utils.upload(video_file, videoid)
      @video.video_id = videoid
    end
    if img_file != nil
      @video.video_img ="http://localhost:3000/files/"+Utils.upload(img_file, nil)
    end

    respond_to do |format|
      if @video.save
        format.html { redirect_to splendid_videos_path }
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
      @video.video_url = "http://localhost:3000/files/"+Utils.upload(video_file, videoid)
      @video.video_id = videoid
    end

    if img_file != nil
      @video.video_img ="http://localhost:3000/files/"+Utils.upload(img_file, nil)
    end
    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to splendid_videos_path }
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
      format.html { redirect_to splendid_videos_url }
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
