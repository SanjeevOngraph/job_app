class PostsController < ApplicationController
  
  include ApplicationHelper

  def index
    if is_employer?
      @posts = Post.where(user_id: current_user.id,is_deleted: false).paginate(page: params[:page], per_page: 5)
    else
      @posts = Post.where(is_deleted: false).paginate(:page => params[:page], :per_page => 5)
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def job
    @posts = current_user.posts.where(is_deleted: false).paginate(:page => params[:page], :per_page => 5)
  end

  def view
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id     
    if @post.save
      flash[:success] = "Sucessfully Created Post"
      redirect_to(posts_path)
    else
      flash[:danger] = @post.errors.full_messages.to_sentence
      render('new')
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params) 
      redirect_to(posts_path(@post))
      flash[:info] = "Post Updated Sucessfully..."
    else
      flash[:danger] = @post.errors.full_messages.to_sentence
      render('edit')
    end
  end

  def delete
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.update_attributes(is_deleted: true)
    flash[:success] = "Post ' #{@post.post_title} ' Sucessfully Deleted..."
    redirect_to(posts_path)
  end

  def job_email
    @posts = Post.find(params[:id])
    emails= [@posts.user.email,current_user.email]
    emails.each do |email|
      UserMailer.job_email(email, current_user).deliver_now
    end
    Applied.create(user_id: current_user.id, post_id: params[:id], emp_id: @posts.user_id)
    redirect_to posts_path
    flash[:success] = "Aplied job Sucessfully."
  end

  def cancel_email
    @posts = Post.find(params[:id])
    emails= [@posts.user.email,current_user.email]
    emails.each do |email|
      UserMailer.cancel_email(email, current_user).deliver_now
    end
    @eid = Post.find_by(id: params[:id]).user_id
    Applied.where(user_id: current_user.id, post_id: params[:id],emp_id: @eid).delete_all
    flash[:success] = "Sucessfully Job Canceled."
    redirect_to posts_path
  end

  private 

  def post_params
    params.required(:post).permit(:post_title,:experience,:salary)
  end

end
