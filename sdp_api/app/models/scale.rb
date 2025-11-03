class Scale < ApplicationRecord
  has_many :items, dependent: :destroy
end
