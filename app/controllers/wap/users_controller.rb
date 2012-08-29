class Wap::UsersController < ApplicationController
  # GET /wap/users
  # GET /wap/users.json
  def index
    @wap_users = Wap::User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wap_users }
    end
  end

  # GET /wap/users/1
  # GET /wap/users/1.json
  def show
    @wap_user = Wap::User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wap_user }
    end
  end

  # GET /wap/users/new
  # GET /wap/users/new.json
  def new
    @wap_user = Wap::User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wap_user }
    end
  end

  # GET /wap/users/1/edit
  def edit
    @wap_user = Wap::User.find(params[:id])
  end

  # POST /wap/users
  # POST /wap/users.json
  def create
    @wap_user = Wap::User.new(params[:wap_user])

    respond_to do |format|
      if @wap_user.save
        format.html { redirect_to @wap_user, notice: 'User was successfully created.' }
        format.json { render json: @wap_user, status: :created, location: @wap_user }
      else
        format.html { render action: "new" }
        format.json { render json: @wap_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wap/users/1
  # PUT /wap/users/1.json
  def update
    @wap_user = Wap::User.find(params[:id])

    respond_to do |format|
      if @wap_user.update_attributes(params[:wap_user])
        format.html { redirect_to @wap_user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wap_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wap/users/1
  # DELETE /wap/users/1.json
  def destroy
    @wap_user = Wap::User.find(params[:id])
    @wap_user.destroy

    respond_to do |format|
      format.html { redirect_to wap_users_url }
      format.json { head :no_content }
    end
  end
end
