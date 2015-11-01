class UsersController < ApplicationController
  # before_action :authenticate_user!
  def profile
    @user = User.find(params[:id])
    @sum  = 0
    @username = @user.firstname + " " + @user.lastname
    @user.posts.each do |post|
       @sum+= post.get_upvotes.size
    end
    @userFollow = @user.follow_count
  end

  def timeline
    @user = User.find(params[:id])
    current_user.all_following.each do |user|
    @followed_posts = user.posts
   end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to profile_user_path(@user)
  end

  def Unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to profile_user_path(@user)
  end

end
