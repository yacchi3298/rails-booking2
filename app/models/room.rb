class Room < ApplicationRecord
    #userモデルに関連付け
    belongs_to :user
    has_many :reservations, dependent: :destroy
    #画像アップロード用
    mount_uploader :image, ImageUploader

    validates :name,:introduction,:priice,:address, presence: true
    validates :priice, numericality: true

    def self.ransackable_attributes(auth_object = nil)
        ["address", "name","introduction"]
    end

    #よくわからないけど必要
    def self.ransackable_associations(auth_object = nil)
        ["user"]
    end

end
