class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts
    end

    def create
        post = Post.create(post_params)
        if post.valid?
            render json: {
                post: post,
                status: 201
        }
        else
            render json: {
                status: 500,
                message: post.errors
            }
        end
    end

    def update
        post = Post.find_by_id(params["id"].to_i)
        if post
            post.update(post_params)
            render json: {
                status: 201,
                message: 'post updated',
                post: post
            }
        else
            render json: {
                status: 501,
                message: 'post not found'
            }
        end

    end

    def destroy 
        post_id = params["id"].to_i
        post = Post.find_by_id(post_id)
        if post
            post.destroy
            render json: {
                status: 201,
                message: 'Post deleted'
            }
        else
            render json: {
                status: 501,
                message: 'Could not find post'
            }
        end

    end


    # private

    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end

end
