class ResponseItem < ApplicationRecord
  belongs_to :response
  belongs_to :item
end
