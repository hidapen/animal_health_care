class Different < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ăȘă' },
    { id: 3, name: 'ăă' },
  ]

  include ActiveHash::Associations
  has_many :tweets
  end