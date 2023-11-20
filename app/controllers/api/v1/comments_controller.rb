class Api::V1::CommentsController < ApplicationController
    def index
        @comments = Comment.all 
        render json: CommentSerializer.new(@comments).serializable_hash[:data][:attributes], status: :ok
    end

    def create  
        @comment = Comment.new(comment_params)
        if @comment.save
            render json: CommentSerializer.new(@comment).serializable_hash[:data][:attributes], status: :created
        else
            render json: { error: @comment.errors.messages }, status: :unprocessable_entity
        end
    end

    private

    def comment_params
        params.permit(:body, :user_name, :user_email)
    end
end