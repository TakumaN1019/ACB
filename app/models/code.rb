class Code < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :block

  # オリジナルのカスタムバリデーション
  validate :add_error_code
  def add_error_code

    if url.present?
      if url !~ /\A(https?|ftp)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)\z/
        errors[:base] << "正しいURLを入力してください。"
      end
    end

  end

end
