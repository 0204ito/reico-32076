class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '肉類', multiple:1 },
    { id: 3, name: '魚介類', multiple:2 },
    { id: 4, name: '乳製品類', multiple:3 },
    { id: 5, name: '卵類' , multiple:4},
    { id: 6, name: 'きのこ・山菜類', multiple:5 },
    { id: 7, name: '野菜類', multiple:6 },
    { id: 8, name: '果物類', multiple:7 },
    { id: 9, name: 'お惣菜類' , multiple:8},
    { id: 10, name: '豆・豆腐類', multiple:9 },
    { id: 11, name: '乾物・海藻類' , multiple:10},
    { id: 12, name: 'ご飯類', multiple:11 },
    { id: 13, name: 'パン類', multiple:12 },
    { id: 14, name: '麺類' , multiple:13},
    { id: 15, name: '調味料', multiple:14},
    { id: 16, name: '乳飲料' , multiple:15},
    { id: 17, name: 'お菓子', multiple:16},
    { id: 18, name: 'その他', multiple:17},
  ]

  include ActiveHash::Associations # 記述してmoduleを取り込む
  has_many :articles
  # ActiveHashを用いて、has_manyを設定する
end
