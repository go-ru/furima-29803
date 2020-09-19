class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, length: { minimum: 6} 
  
  NAME_REGEX_ZENKAKU = /\A[ぁ-んァ-ン一-龥]/ 
  NAME_REGEX_KATAKANA = /\A[ァ-ヶー－]+\z/


  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: NAME_REGEX_ZENKAKU }
    validates :last_name, format: { with: NAME_REGEX_ZENKAKU }
    validates :furigana_first, format: { with: NAME_REGEX_KATAKANA}
    validates :furigana_last, format: { with: NAME_REGEX_KATAKANA}
    validates :birthday
  end

  has_many :items

end
