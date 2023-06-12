class QrCode < ApplicationRecord
  validates :url, presence: true
end
