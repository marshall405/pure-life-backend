class PostsController < ApplicationController
    skip_before_action :authorize_request, only: :index
    def index
        posts = Post.all
        render json: posts
    end

    def create
        if current_user.is_admin
            post = Post.new(post_params)
            post.user_id = current_user.id
            if post.save
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
        else
            render json: {message: 'unauthorized'}
        end
    end

    def update
        if current_user.is_admin
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
        else
            render json: {message: 'unauthorized'}
        end

    end

    def destroy 
        if current_user.is_admin
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
        else
            render json: {message: 'unauthorized'}
        end
    end


    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

end
