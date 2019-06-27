class Code < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :block
end
