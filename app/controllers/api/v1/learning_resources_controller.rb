class Api::V1::LearningResourcesController < ApplicationController
  def index
    learning_resources = LearningResourceFacade.get_resources(params[:country])
    render json: LearningResourceSerializer.new(learning_resources)
  end
end