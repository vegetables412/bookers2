class UsersController < ApplicationController

# before_action :correct_user, only: [:edit, :update]

	def index
		@users = User.all
		@user = current_user
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = current_user.books.all
	end
	def edit
		@user = User.find(params[:id])
	end

	def update
    	@user = User.find(params[:id])
    	if @user.update(user_params)
    		redirect_to user_path(@user.id)
    	else
    		redirect_to user_path(@user.id), notice: "自己紹介文の長さは最大50文字です。"
    	end
	end

# protected
# 	def correct_user
		# user = User.find(params[:id])
		# @user = User.find(params[:id])
		# if current_user != @user
		# redirect_to root_path
		# redirect_to(root_url) unless @user == current_user
		# end
	# end

private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end



end
