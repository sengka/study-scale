class Api::V1::ScalesController < ApplicationController
  def create
    scale = Scale.create!(scale_params)
    params[:items]&.each do |it|
      scale.items.create!(text: it[:text], min: it[:min] || 1, max: it[:max] || 5)
    end
    render json: scale.as_json(include: :items), status: :created
  end

  def show
    render json: Scale.includes(:items).find(params[:id]).as_json(include: :items)
  end

  def index
    render json: Scale.all.as_json(only: %i[id title])
  end

  private

  def scale_params
    params.permit(:title, :description)
  end
end
