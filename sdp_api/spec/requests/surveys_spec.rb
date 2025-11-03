# spec/requests/surveys_spec.rb
require "rails_helper"

RSpec.describe "Surveys", type: :request do
  it "creates survey, accepts a response, summarizes" do
    # 1) Ölçek ve maddelerini hazırlayalım
    scale = Scale.create!(title: "X")
    i1 = scale.items.create!(text: "i1", min: 1, max: 5)
    i2 = scale.items.create!(text: "i2", min: 1, max: 5)

    # 2) Survey oluştur
    post "/api/v1/surveys", params: { scale_id: scale.id }
    expect(response).to have_http_status(:created)
    survey_id = JSON.parse(response.body)["id"]

    # 3) Response gönder
    post "/api/v1/surveys/#{survey_id}/responses", params: {
      participant_code: "P1",
      answers: [{ item_id: i1.id, value: 4 }, { item_id: i2.id, value: 4 }]
    }
    expect(response).to have_http_status(:created)

    # 4) Summary kontrol
    get "/api/v1/surveys/#{survey_id}/summary"
    expect(response).to have_http_status(:ok)
    rows = JSON.parse(response.body)

    # Her iki maddede ortalama 4 ve n=1 bekliyoruz
    expect(rows.size).to eq(2)
    rows.each do |r|
      expect(r["avg"]).to eq(4.0)
      expect(r["n"]).to eq(1)
    end
  end
end
