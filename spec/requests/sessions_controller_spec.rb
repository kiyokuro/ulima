require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe "#new" do
    context 'アクセス成功' do
      before { get :new }
      it { expect(response).to be_success }
    end
  end

  describe '#create' do
    let!(:user) { create(:user) }
    context 'ログイン成功' do
      before { post :create, params: { session: { email: 'example@example.com', password: 'password' } } }
      it { expect(response).to redirect_to(root_path) }
    end
    context 'ログイン失敗' do
      before { post :create, params: { session: { email: 'aaa@a.com', password: 'password' } } }
      it { expect(response).to render_template('new') }
    end
  end
end
