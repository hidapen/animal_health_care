class Tweet < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :energy, :food, :toilet, :poop_status, :exercise, :sleep, :different

  with_options numericality: { other_than: 1 } do
    validates :energy_id
    validates :food_id
    validates :toilet_id
    validates :poop_status_id
    validates :exercise_id
    validates :sleep_id
    validates :different_id
  end
  validates :user_id, presence: true
end
