class User < ApplicationRecord
  has_many :tweets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください' } do
      validates :human_first_name
      validates :human_last_name
      validates :pets_name
      validates :pets_type
    end
    with_options format: {with: /\A[ァ-ヶー]+\z/, message: "全角（カタカナ）を使用してください"} do
      validates :human_first_name_rubi
      validates :human_last_name_rubi
      validates :pets_name_rubi
    end
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角で英字と数字の両方を含めて設定してください'
    validates :pets_age, format: {with: /\A[\d]+\z/, message: "数字を使用してください"}
  end
end
