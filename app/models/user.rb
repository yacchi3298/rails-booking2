class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  #roomモデルに関連付け
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  #画像アップロード用
  mount_uploader :icon, IconUploader
end
