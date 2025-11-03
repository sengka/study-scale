class Api::V1::SurveysController < ApplicationController
  def create
    survey = Survey.create!(scale_id: params[:scale_id], status: :active)
    render json: { id: survey.id, scale_id: survey.scale_id }, status: :created
  end

  def show
    survey = Survey.find(params[:id])
    render json: {
      id: survey.id,
      status: survey.status,
      scale: survey.scale.as_json(include: :items)
    }
  end

def summary
  survey = Survey.find(params[:id])

  rows = ResponseItem
           .joins(:response, :item)
           .where(responses: { survey_id: survey.id })
           .group('items.id', 'items.text')
           .select(
             'items.id AS item_id',
             'items.text AS item_text',
             Arel.sql('AVG(response_items.value) AS avg_value'),
             Arel.sql('COUNT(response_items.id) AS n')
           )

  render json: rows.map { |r|
    { item_id: r.item_id, item_text: r.item_text, avg: r.avg_value.to_f, n: r.n.to_i }
  }
end

end
