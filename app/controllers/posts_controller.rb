class PostsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource

	def index
		@posts = Post.all
	end

	def edit
		@posts = Post.new(current_post.id)
	end

	def new
		@posts = Post.new({:name => 'default'})
	end

	def show
		@posts = Post.all
	end

	def create
		@posts = Post.new(current_post.id)
		if @posts.save
			flash[:notice] = "Sucessfully Created Post"
			redirect_to(posts_path)
		else
			render('new')
		end
	end

	def update
    @posts = Post.find(current_post.id)
    if @post.update_attributes(post_params)
      flash[:notice] = "Post Updated Sucessfully........"
      redirect_to(posts_path(@posts))
    else
      render('edit')
    end
  end

  def delete
    @posts = Post.find(current_post.id)
  end

  def destroy
    @posts = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post '#{@post.post_title}'Created Sucessfully........"
    redirect_to(posts_path)
  end

  private 

  def post_params
    params.required(:post).permit(:post_title,:experience,:salery)
  end

end
