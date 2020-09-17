class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ドリブル' },
    { id: 3, name: 'シュート' },
    { id: 4, name: 'パス' },
    { id: 5, name: 'ディフェンス' },
    { id: 6, name: 'その他' }
  ]
end
