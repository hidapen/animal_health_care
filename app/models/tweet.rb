class Tweet < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :energy
  belongs_to :food
  belongs_to :toilet
  belongs_to :poop_status
  belongs_to :exercise
  belongs_to :sleep
  belongs_to :different

  with_options numericality: { other_than: 1 } do
    validates :energy_id
    validates :food_id
    validates :toilet_id
    validates :poop_status_id
    validates :exercise_id
    validates :sleep_id
    validates :different_id
  end
end
