class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  
  validates :password,        presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字を含めてください'}
  
  with_options presence: true, format: { with: /\A[ぁ-ん一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'カナ文字を使用してください' } do
  validates :last_name_kana,  presence: true
  validates :first_name_kana, presence: true
  end

  validates :birth_date,      presence: true

  has_many :items
  has_many :purchase_items

end
