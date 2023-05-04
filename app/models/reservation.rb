class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :checkin,:checkout,:Number_of_people, presence: true
  validates :Number_of_people, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validate :start_finish_check
  #validate :start_check

  def start_finish_check
    unless checkin.nil? || checkout.nil?
      errors.add(:checkout, "はチェックイン日より遅い日程を選択してください") if checkin >= checkout
    end
  end

 # def start_check
  #  unless checkin.nil? || checkout.nil?
  #    errors.add(:checkin, "は現在より遅い日程を選択してください") if checkin < Time.now
  #  end
 # end
end
