# spec/requests/scales_spec.rb
require "rails_helper"

RSpec.describe "Scales", type: :request do
  it "creates a scale with two items" do
    post "/api/v1/scales", params: {
      title: "DD",
      description: "MVP",
      items: [{ text: "Keyifsiz" }, { text: "Enerji" }]
    }

    expect(response).to have_http_status(:created)
    body = JSON.parse(response.body)
    expect(body["title"]).to eq("DD")
    expect(body["items"].size).to eq(2)
  end
end
