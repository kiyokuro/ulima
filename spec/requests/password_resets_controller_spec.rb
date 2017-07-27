require 'rails_helper'

RSpec.describe PasswordResetsController, type: :request do
  let!(:user) { create(:user) }
  before { create_reset_digest(user) }
  describe '#new' do
    context 'getアクセス' do
      before { get new_password_reset_path }
      it { expect(response).to render_template 'new' }
    end
  end
  describe '#create' do
    context 'メールアドレスに対応するユーザがいない' do
      before { post password_resets_path, params: { password_reset: { email: '' } } }
      it { expect(response).to render_template 'new' }
    end
    context 'メールアドレスに対応するユーザがいる' do
      before { post password_resets_path, params: { password_reset: { email: 'example@example.com' } } }
      it { expect(response).to redirect_to root_url }
    end
  end
  describe '#edit' do
    context 'メールを送信したユーザが以外がアクセス' do
      let!(:user2) { create(:user2) }
      before { get edit_password_reset_path user.reset_token, params: { id: user.reset_token, email: user2.email } }
      it { expect(response).to redirect_to root_url }
    end
    context 'メールを送信したユーザがアクセス' do
      before { get edit_password_reset_path user.reset_token, params: { id: user.reset_token, email: user.email } }
      it { expect(response).to render_template 'edit' }
    end
  end
  describe '#update' do
    context 'メールを送信したユーザが以外がアクセス' do
      let!(:user2) { create(:user2) }
      before do
        create_reset_digest(user2)
        patch password_reset_path user2.reset_token, params: { id: user2.id, user: { password: '123456', password_confirmation: '123456' } }
      end
      it { expect(response).to redirect_to root_url }
    end
    context 'パスワードのと確認用パスワードが異なる' do
      before { patch password_reset_path user.id, params: { user: { password: '123456', password_confirmation: '654321' } } }
      # it { expect(response).to render_template 'edit' }
    end
    context 'パスワードが6文字以下' do
      before { patch password_reset_path user.id, params: { user: { password: '123', password_confirmation: '123' } } }
      # it { expect(response).to render_template 'edit' }
    end
    context 'パスワード変更成功' do
      before { patch password_reset_path user.id, params: { user: { password: '123456', password_confirmation: '123456' } } }
      it { expect(response).to redirect_to root_url }
    end
  end
end
