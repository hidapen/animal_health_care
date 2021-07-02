class PoopStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'とても良い' },
    { id: 3, name: '良い' },
    { id: 4, name: '普通' },
    { id: 5, name: '悪い' },
    { id: 6, name: 'とても悪い' },
  ]

  include ActiveHash::Associations
  has_many :tweets
  end