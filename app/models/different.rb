class Different < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ない' },
    { id: 3, name: 'ある' },
  ]

  include ActiveHash::Associations
  has_many :tweets
  end