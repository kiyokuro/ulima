require 'rails_helper'

RSpec.describe StaticPagesController, type: :request do
  let!(:user) { create(:user) }
  let(:item) { create(:item, param) }

  describe "GET home" do
    before { get root_path }
    context 'ログイン前のユーザ' do
      it { expect(response).to be_success }
      it { expect(response).to render_template('home') }
    end
    context 'ログイン済みのユーザ' do
    end
    context 'show_enableがtrueのアイテムを取得' do
      let!(:param) { { show_enable: true } }
      before { get root_path }
    end
    context 'show_enableがfalseのアイテムを取得' do
      let!(:param) { { show_enable: false } }
      before { get root_path }
    end
  end
end
