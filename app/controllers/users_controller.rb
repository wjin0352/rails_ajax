class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    @users = User.all.reverse_order
  end

  def create
    @user = User.new(params[:user].permit(:name, :review))
      if @user.save
        respond_to do |format|
          format.html { render :json => User.all }
        end
      end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url, notice: 'User was successfully deleted.'}
      format.json {head :no_content}
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_params
    params.require(:article).permit(:name, :review)
  end

end
