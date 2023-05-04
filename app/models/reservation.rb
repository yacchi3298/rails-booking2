class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :checkin,:checkout,:Number_of_people, presence: true
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
