class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    has_many :items,dependent: :destroy
    has_many :purchases,dependent: :destroy

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,255}\z/i
    VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
    VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/

    with_options presence: true do
      validates :nickname
      validates :email, uniqueness: true, format: { with: /@/, message: '@を使用してください'}
      validates :password, length: { in: 7..255 }, format: { with: VALID_PASSWORD_REGEX, message: '8文字以上に設定してください'}
      validates :password_confirmation
      validates :firstname, format: { with: VALID_ZENKAKU_REGEX, message: '全角文字を使用してください' } 
      validates :lastname, format: { with: VALID_ZENKAKU_REGEX, message: '全角文字を使用してください' } 
      validates :firstname_kana, format: { with: VALID_KATAKANA_REGEX, message: 'カタカナを使用してください' } 
      validates :lastname_kana, format: { with: VALID_KATAKANA_REGEX, message: 'カタカナを使用してください' } 
      validates :birthday
      
    end
  end