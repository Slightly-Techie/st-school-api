class Api::V1::StacksController < ApplicationController
  def index
    @results = Stack.includes(:stack_options)
    render json: @results.map { |stack| stack.serializable_hash(only: 'name', include: { stack_options: { only: 'name' }}) }
  end
end
