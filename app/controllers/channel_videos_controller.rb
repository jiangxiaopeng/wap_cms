class ChannelVideosController < ApplicationController
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

    @videos = Video.where(:video_type => 1,:cid => @channel).order(:id)
    if current_user != nil
      respond_to do |format|
        format.html # index.html.erb
      end
    else
      redirect_to :controller => "users",:action => "sign_in"
    end
  end

  # GET /today_videos/1
  # GET /today_videos/1.json
  def show
    @channel = params[:forminfo]
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end

  # GET /today_videos/new
  # GET /today_videos/new.json
  def new
    @channel = params[:forminfo]
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
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
    @channel = params[:forminfo]
    @video = Video.new(params[:video])
    video_file = params[:video_file]
    img_file = params[:img_file]
    @video.video_type = params[:video_type]
    @video.video_id = Utils.videoid
    
    if video_file != nil
      @video.video_url = "http://#{Constants::UPLOAD_IP}/files/"+Utils.upload(video_file, videoid)
    end

    if img_file != nil
      @video.video_img ="http://#{Constants::UPLOAD_IP}/files/"+Utils.upload(img_file, nil)
    end
    @video.cid = @channel
    respond_to do |format|
      if @video.save
        format.html { redirect_to channel_videos_path }
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
      @video.video_url = "http://#{Constants::UPLOAD_IP}/files/"+Utils.upload(video_file, videoid)
    end

    if img_file != nil
      @video.video_img ="http://#{Constants::UPLOAD_IP}/files/"+Utils.upload(img_file, nil)
    end

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to channel_videos_path }
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
      format.html { redirect_to channel_videos_url }
    end
  end
end
