require 'rails_helper'
describe RefrigesController, type: :request do
  
  before do
    @refrige = FactoryBot.create(:refrige)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do

      # get refriges_path
      # expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに新規作成済みのrefrigeが存在する' do
    end
  end
end
