class PostsController < ApplicationController
	
	include ApplicationHelper

	def index
		if is_employer?
			@posts = Post.where(user_id: current_user.id).paginate(page: params[:page], per_page: 5)
		else
			@posts = Post.paginate(:page => params[:page], :per_page => 5)
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
    @posts = current_user.posts.paginate(:page => params[:page], :per_page => 5)
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
			flash[:danger] = @post.errors.full_messages.inspect
			render('new')
		end
	end

	def update
		@post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params)	
      redirect_to(posts_path(@post))
      flash[:info] = "Post Updated Sucessfully..."
    else
      render('edit')
    end
  end

  def delete
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post ' #{@post.post_title} ' Sucessfully Deleted..."
    redirect_to(posts_path)
  end

	def job_email
		@posts = Post.find(params[:id])
		UserMailer.job_email(@posts, current_user).deliver_now
		@eid = Post.find_by(id: params[:id]).user_id
		Applied.create(user_id: current_user.id, post_id: params[:id], emp_id: @eid)
		redirect_to posts_path
		flash[:success] = "Aplied job Sucessfully."
	end

	def cancel_email
		@posts = Post.find(params[:id])
		UserMailer.cancel_email(@posts, current_user).deliver_now
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
