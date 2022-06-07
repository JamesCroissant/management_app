class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :schedules

  validates :nickname, presence: true, uniqueness: { case_sensitive: true }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字の両方を含める必要があります' }, allow_blank: true

  with_options allow_blank: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :birthday, presence: true
  validates :occupation, presence: true
  validates :phone_number, presence: true                    # 直す
  validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only number' },
                           length: { minimum: 10, maximum: 11 }, allow_blank: true
end
