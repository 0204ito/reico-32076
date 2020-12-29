require 'rails_helper'

RSpec.describe '冷蔵庫作成', type: :system do
  def visit_with_http_auth(path)
    username = ENV['BASIC_AUTH_USER']
    password = ENV['BASIC_AUTH_PASSWORD']
    visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
  end
  before do
    @refrige_user = FactoryBot.create(:refrige_user)
    @food = FactoryBot.build(:food)
  end
  it 'ログインしたユーザーは食材追加ページで食材を追加できる' do
    # ログインする
    visit_with_http_auth(path)
    # トップページに移動する
    visit root_path
    expect(page).to have_content('ログイン')
    visit new_user_session_path
    fill_in 'メールアドレス', with: @refrige_user.user.email
    fill_in 'パスワード', with: @refrige_user.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('My home')
    # 個人ページへ遷移する
    visit refriges_path
    # 冷蔵庫のリンクをクリックする
    find('.refrige_name').click
    # 冷蔵庫ページへ遷移
    expect(current_path).to eq  refrige_foods_path(@refrige_user.refrige_id)
    # 食材追加のリンクがある事を確認
    expect(page).to have_content('食材追加')
    # 食材追加ページへ遷移
    visit new_refrige_food_path(@refrige_user.refrige_id)
    # フォームに情報を入力する
    fill_in 'food[food_name]', with: @food.food_name
    fill_in 'food[product_name]', with: @food.product_name
    category_name = @food.category.name
    select category_name, from: "food[category_id]"
    fill_in 'food[purchase_date]', with: @food.purchase_date
    fill_in 'food[sell_by]', with: @food.sell_by
    fill_in 'food[shop]', with: @food.shop
    # 送信するとFoodモデルのカウントが1上がることを確認する
    expect {
      find('input[name="commit"]').click
      }.to change { Food.count }.by(1)
    # 冷蔵庫ページへ遷移
    find('.menu__right').click
    # 冷蔵庫ページに先ほど追加した食材が含まれている事を確認する

  end

end