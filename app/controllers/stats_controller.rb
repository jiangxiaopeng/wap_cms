class StatsController < ApplicationController
  layout "admin"
  # GET /stats
  # GET /stats.json
  def index
    @title = params[:title]
    if @title
      @stats = Stat.where(:title=>@title).page(params[:page]).per(20)
    else
      @stats = Stat.page(params[:page]).per(20)
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stats }
    end
  end

  # GET /stats/1
  # GET /stats/1.json
  def show
    @stat = Stat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stat }
    end
  end

  # GET /stats/new
  # GET /stats/new.json
  def new
    @stat = Stat.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stat }
    end
  end

  # GET /stats/1/edit
  def edit
    @title = params[:title]
    @stat = Stat.find(params[:id])
  end

  # POST /stats
  # POST /stats.json
  def create
    @stat = Stat.new(params[:stat])
    respond_to do |format|
      if @stat.save
        format.html { redirect_to @stat, notice: 'Stat was successfully created.' }
        format.json { render json: @stat, status: :created, location: @stat }
      else
        format.html { render action: "new" }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stats/1
  # PUT /stats/1.json
  def update
    @title = params[:title]
    @stat = Stat.find(params[:id])

    respond_to do |format|
      if @stat.update_attributes(params[:stat])
        format.html { redirect_to stats_url(:title=>@title), notice: 'Stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stats/1
  # DELETE /stats/1.json
  def destroy
    @stat = Stat.find(params[:id])
    @stat.destroy

    respond_to do |format|
      format.html { redirect_to stats_url }
      format.json { head :no_content }
    end
  end

  def batch
    @videos = Video.all
    @videos.each do |video|
      exist = Stat.find_by_video_id(video.video_id)
      puts video.video_id
      if exist == nil
        stat = Stat.new
        stat.video_id = video.video_id
        stat.title = video.title
        stat.purchase_count = 0
        stat.play_count = 0
        stat.save
      end
    end
    redirect_to :action => "index"
  end
end
