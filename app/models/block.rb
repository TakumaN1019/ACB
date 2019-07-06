class Block < ApplicationRecord

  belongs_to :user
  has_many :codes, dependent: :destroy
  has_many :picks
  has_many :systems, through: :picks

  # Blockが削除されたらCodeも削除する。
  accepts_nested_attributes_for :codes, allow_destroy: true

  # オリジナルのカスタムバリデーション(日本語化するよりもこっちのほうが自由度が高いので良い)
  validate :add_error_user
  def add_error_user
    # ブロックネームが空のときにエラーメッセージ
    if name.blank?
      errors[:base] << "ブロックネームは必ず入力してください。"
    end

    # ブロックネームが20文字以上のときのエラーメッセージ
    if name.present?
      if name.length > 50
        errors[:base] << "ブロックネームは50文字以内にしてください。"
      end
    end
  end

end
