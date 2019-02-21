class PostsController < ApplicationController
	
	include ApplicationHelper

	def index
		if is_employer?
			@posts = Post.where(user_id: current_user.id)
		else
			@posts = Post.all
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

	def view
		@post = Post.find_by(id: params[:id])
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save!
			flash[:notice] = "Sucessfully Created Post"
			redirect_to(posts_path)
		else
			render('new')
		end
	end

	def update
	@post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params)	
      flash[:notice] = "Post Updated Sucessfully........"
      redirect_to(posts_path(@post))
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
    flash[:notice] = "Post '#{@post.post_title}'Created Sucessfully........"
    redirect_to(posts_path)
  end

   def job_email
    @posts = Post.find(params[:id])
    UserMailer.apply_job_email(@posts).deliver_now
    Applied.create(user_id: current_user.id, post_id: params[:id])
    redirect_to posts_path
    flash[:sucess] = "Aplied job Sucessfully."
   end

   def cancel_email
   	@posts = Post.find(params[:id])
   	UserMailer.cancel_email(@posts).deliver_now
   	Applied.where(user_id: current_user.id, post_id: params[:id]).delete_all
   	redirect_to posts_path
    flash[:sucess] = "Sucessfully Job Canceled."
   end

  private 

  def post_params
    params.required(:post).permit(:post_title,:experience,:salary)
  end

end
