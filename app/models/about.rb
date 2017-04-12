class About < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}
end
