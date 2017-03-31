# rubocop:disable LineLength
class Ticket < ApplicationRecord
  validates :name, :image, :code, :price, :stock_quantity, presence: true
  belongs_to :user

  has_attached_file :image, styles: { large: '600x600>', medium: '300x300>', thumb: '150x150>' }, default_url: '/system/tickets/images/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
