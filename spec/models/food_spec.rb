require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @refrige = FactoryBot.create(:refrige) 
    @food = FactoryBot.build(:food, refrige_id: @refrige.id)
  end
  describe '食材の登録' do
    context '食材登録がうまくいくとき' do
      it 'food_name,category_id,purchase_date,sell_by,checkedが存在すれば登録できる' do
        expect(@food).to be_valid
      end
    end
    context '食材登録がうまくいかないとき' do
      it 'food_nameが空だと登録できない' do
        @food.food_name = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("Food name can't be blank")
      end
      it 'category_idが１では登録できない' do
        @food.category_id = '1'
        @food.valid?
        expect(@food.errors.full_messages).to include('Category must be other than 1')
      end



      it 'purchase_dateが空だと登録できない' do
        @food.purchase_date = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("Purchase date can't be blank")
      end
      it 'sell_byが空だと登録できない' do
        @food.sell_by = ''
        @food.valid?
        expect(@food.errors.full_messages).to include("Sell by can't be blank")
      end
  
    end
  end
  
end