require 'rails_helper'

RSpec.describe Refrige, type: :model do
  before do
    @refrige = FactoryBot.build(:refrige)
  end

  describe '冷蔵庫の新規登録' do
    context '新規登録がうまくいくとき' do
      it 'refrige_nameとuserが存在すれば登録できる' do
        expect(@refrige).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'refrige_nameが空だと登録できない' do
        @refrige.refrige_name = ''
        @refrige.valid?
        expect(@refrige.errors.full_messages).to include("Refrige name can't be blank")
      end
      it '重複したrefrige_nameが存在する場合登録できない' do
        @refrige.save
        another_refrige = FactoryBot.build(:refrige)
        another_refrige.refrige_name = @refrige.refrige_name
        another_refrige.valid?
        expect(another_refrige.errors.full_messages).to include('Refrige name has already been taken')
      end
      # it 'userが紐付いていないと保存できないこと' do
      #   @refrige.user = nil
      #   @refrige.valid?
      #   expect(@refrige.errors.full_messages).to include('User must exist')
      # end
    end
  end
end
