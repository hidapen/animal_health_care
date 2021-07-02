class Toilet < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'とても多い' },
    { id: 3, name: '多い' },
    { id: 4, name: '普通' },
    { id: 5, name: '少ない' },
    { id: 6, name: 'とても少ない' },
  ]

  include ActiveHash::Associations
  has_many :tweets
  end