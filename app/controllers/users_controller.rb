class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = (User.where(:id => params[:id]))[0]
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = (User.where(:id => params[:id]))[0]
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new({"mail":params[:mail], "password":params[:password]})

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update({mail:params[:mail], password:params[:password]})
        format.html { redirect_to "/users/#{@user[:id]}", notice: 'Пользователь был успешно изменен!.' }
        format.json { render :show, status: :ok, location: "/users/#{@user[:id]}"}
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
