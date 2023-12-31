class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_login, except: [:new, :create]

  # GET /users or /users.json
  def index
    # If logged in as admin, show all users.
    if logged_in? && is_administrator?
      @users = User.all
    # if logged in as standard user, take them to their user landing page.
    elsif logged_in? && !is_administrator?
      redirect_to userhome_path
    # if no one is logged in, generate unauthorised message
    else
      flash[:error] = "You are not authorised to access this resource"
      redirect_to login_path
  end
end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if !@user.save
        flash.now[:alert] = "Email must be unique"
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      else      
        #format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.html {redirect_to login_path, notice: "Sign up successful. Please log in."}
        format.json { render :show, status: :created, location: @user }
      end
    end
  end


  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:fname, :lname, :email, :password, :is_admin, :status)
    end
end
