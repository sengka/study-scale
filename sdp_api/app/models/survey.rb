class Survey < ApplicationRecord
  belongs_to :scale
  has_many :responses, dependent: :destroy

  # Yeni yazım (Rails 7.1+): enum :attribute, values_hash
  enum :status, { draft: 0, active: 1 }
end
