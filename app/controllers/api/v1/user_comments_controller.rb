class Api::V1::UserCommentsController < ApplicationController
    def index
        @comments = UserComment.all 
        render json: UserCommentSerializer.new(@comments).serializable_hash[:data].map { |comment| comment[:attributes] }, status: :ok            
    end

    def create  
        @comment = UserComment.new(comment_params)
        if @comment.save
            render json: UserCommentSerializer.new(@comment).serializable_hash[:data][:attributes], status: :created
        else
            render json: { error: @comment.errors.messages }, status: :unprocessable_entity
        end
    end

    
    private

    def comment_params
        params.permit(:body, :user_name, :user_email)
    end
end