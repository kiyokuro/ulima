require 'rails_helper'

RSpec.describe PurchasesController, type: :request do
  let!(:user) { create(:user) }
  let(:item) { create(:item, param) }
  before { log_in_as(user) }

  describe 'create' do
    context 'アイテムを購入できた' do
      let!(:param) { { quantity: 1 } }
      before { post purchases_path, params: { id: item.id } }
      it { expect(response).to render_template 'buy_success' }
    end
    context 'アイテムの購入に失敗した' do
      let!(:param) { { quantity: 0 } }
      before { post purchases_path, params: { id: item.id } }
      it { expect(response).to render_template 'items/soldout' }
    end
  end

  describe 'index' do
    context 'getでアクセス' do
      before { get purchases_path }
      it { expect(response).to redirect_to root_path }
    end
  end
end
