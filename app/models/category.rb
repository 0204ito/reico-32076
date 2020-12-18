class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '肉類' },
    { id: 3, name: '魚介類' },
    { id: 4, name: '乳製品類' },
    { id: 5, name: '卵類' },
    { id: 6, name: 'きのこ・山菜類' },
    { id: 7, name: '野菜類' },
    { id: 8, name: '果物類' },
    { id: 9, name: 'お惣菜類' },
    { id: 10, name: '豆・豆腐類' },
    { id: 11, name: '乾物・海藻類' },
    { id: 12, name: 'ご飯類' },
    { id: 13, name: 'パン類' },
    { id: 14, name: '麺類' },
    { id: 15, name: '調味料' },
    { id: 16, name: '乳飲料' },
    { id: 17, name: 'お菓子' },
    { id: 18, name: 'その他' },
  ]

  include ActiveHash::Associations # 記述してmoduleを取り込む
  has_many :articles
  # ActiveHashを用いて、has_manyを設定する
end
