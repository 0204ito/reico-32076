require 'rails_helper'

RSpec.describe '冷蔵庫作成', type: :system do
  def visit_with_http_auth(path)
    username = ENV['BASIC_AUTH_USER']
    password = ENV['BASIC_AUTH_PASSWORD']
    visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
  end
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end
  context '冷蔵庫が作成できるとき' do
    it 'ログインしたユーザーは冷蔵庫が作成できる' do
      # ログインする
      visit_with_http_auth(path)
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user1.email
      fill_in 'パスワード', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 冷蔵庫作成のリンクがあることを確認する
      expect(page).to have_content('New my reico')
      # 冷蔵庫作成ページに移動する
      visit new_refrige_path
      # フォームに情報を入力する
      fill_in 'refrige_name', with: 'bbb'
      # メンバーを選択する
      user_name = @user2.nickname
      select user_name, from: 'refrige[user_ids][]'
      # 送信するとRefrigeモデルのカウントが1上がることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Refrige.count }.by(1)
      # トップページに遷移することを確認する
      visit_with_http_auth root_path
      # トップページのmy homeボタンがある事を確認する
      expect(page).to have_content('My home')
      # 個人ページに遷移する事を確認する
      visit refriges_path
      # 個人ページには先ほど作成した冷蔵庫が存在することを確認する（テキスト）
    end
  end
  context '冷蔵庫が作成できないとき' do
    it '間違った情報では冷蔵庫作成ができずそのページに止まる' do
      # ログインする
      visit_with_http_auth(path)
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user1.email
      fill_in 'パスワード', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 冷蔵庫作成のリンクがあることを確認する
      expect(page).to have_content('New my reico')
      # 冷蔵庫作成ページに移動する
      visit new_refrige_path
      # フォームに情報を入力する
      fill_in 'refrige_name', with: ' '
      # メンバーを選択する
      user_name = @user2.nickname
      select user_name, from: 'refrige[user_ids][]'
      # 送信するとRefrigeモデルのカウントが変わらないことを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Refrige.count }.by(0)
      # 冷蔵庫作成ページに遷移することを確認する
      expect(current_path).to eq '/refriges'
    end
  end
end
