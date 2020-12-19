require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @refrige = FactoryBot.create(:refrige)
    @comment = FactoryBot.build(:comment, user_id: @user.id, refrige_id: @refrige.id)
  end
  describe 'コメントの登録' do
    context 'コメント登録がうまくいくとき' do
      it 'textとが存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント登録がうまくいかないとき' do
      it 'textが空だと登録できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
