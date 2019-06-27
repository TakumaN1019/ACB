class System < ApplicationRecord

  belongs_to :user
  has_many :picks
  has_many :blocks, through: :picks


  # オリジナルのカスタムバリデーション(日本語化するよりもこっちのほうが自由度が高いので良い)
  validate :add_error_user
  def add_error_user
    # レシピ名が空のときにエラーメッセージ
    if name.blank?
      errors[:base] << "レシピ名は必ず入力してください。"
    end

    # レシピ名が20文字以上のときのエラーメッセージ
    if name.present?
      if name.length > 50
        errors[:base] << "レシピ名は50文字以内にしてください。"
      end
    end
  end

end
