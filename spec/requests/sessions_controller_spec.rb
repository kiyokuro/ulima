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
      it { expect(session[:user_id]).to eq user.id }
      it { expect(cookies.permanent.signed[:user_id]).to eq user.id }
      it { expect(cookies.permanent.signed[:remember_token]).not_to eq nil }
    end
    context 'メールアドレスが間違えてログイン失敗' do
      before { post :create, params: { session: { email: 'aaa@a.com', password: 'password' } } }
      it { expect(response).to render_template('new') }
      it { expect(flash[:danger]).not_to be_empty }
    end
    context 'パスワードが間違えてログイン失敗' do
      before { post :create, params: { session: { email: 'example@example.com', password: 'pppppp' } } }
      it { expect(response).to render_template('new') }
      it { expect(flash[:danger]).not_to be_empty }
    end
  end

  describe '#destroy' do
    let!(:user) { create(:user) }
    context 'ログアウト成功' do
      before do
        post :create, params: { session: { email: 'example@example.com', password: 'password' } }
        delete :destroy
      end
      it { expect(@current_user).to be nil }
      it { expect(session[:user_id]).to be nil }
    end
  end
end
