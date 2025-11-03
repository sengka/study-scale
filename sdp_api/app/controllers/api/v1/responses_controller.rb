class Api::V1::ResponsesController < ApplicationController
  def create
    survey = Survey.find(params[:survey_id])
    resp = survey.responses.create!(participant_code: params[:participant_code])
    params[:answers].each do |a|
      resp.response_items.create!(item_id: a[:item_id], value: a[:value].to_i)
    end
    render json: { id: resp.id }, status: :created
  end
end
