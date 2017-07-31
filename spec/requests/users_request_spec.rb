require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe '#new' do
    let!(:user) { User.new }
    context 'アクセスされた' do
      before { get signup_path }
      it { expect(response).to render_template 'new' }
    end
  end
  describe '#create' do
    context 'ユーザ作成できたとき' do
      before { post signup_path, params: { user: { name: 'name', email: 'email@example.com', slack_id: '', password: 'hogehoge', password_confirmation: 'hogehoge' } } }
      it { expect(response).to redirect_to(root_url) }
    end
    context 'ユーザ作成できないとき' do
      before { post signup_path, params: { user: { name: ' ', email: ' ', slack_id: '', password: 'hogehoge', password_confirmation: 'hogehoge' } } }
      it { expect(response).to render_template('new') }
    end
  end

  describe 'バリデーション' do
    let!(:user) { build(:user, params) }
    context '入力が正しい' do
      let!(:params) { {} }
      it { expect(user.valid?).to eq true }
    end
    context '名前が空' do
      let!(:params) { { name: ' ' } }
      it { expect(user.valid?).to eq false }
    end
    context 'emailが空' do
      let!(:params) { { email: ' ' } }
      it { expect(user.valid?).to eq false }
    end
    context 'passwordが空' do
      let!(:params) { { password: ' ', password_confirmation: ' ' } }
      it { expect(user.valid?).to eq false }
    end
    context 'passwordの文字数が６未満' do
      let!(:params) { { password: '12345', password_confirmation: '12345' } }
      it { expect(user.valid?).to eq false }
    end
    context 'passwordとpassword_confirmationが異なる' do
      let!(:params) { { password: '123456', password_confirmation: '654321' } }
      it { expect(user.valid?).to eq false }
    end
    context 'emailがフォーマットと異なる' do
      let!(:params) { { email: 'hoge@com' } }
      it { expect(user.valid?).to eq false }
      let!(:params) { { email: 'hoge@hoge..com' } }
      it { expect(user.valid?).to eq false }
      let!(:params) { { email: 'hoge.com' } }
      it { expect(user.valid?).to eq false }
    end
  end
  describe '#edit' do
    let!(:user) { create(:user) }
    context 'ログイン前' do
      before { get edit_user_path user }
      it { expect(response).to redirect_to login_path }
    end
    context 'ログイン後' do
      before do
        log_in_as user
        get edit_user_path user
      end
      it { expect(response).to render_template 'edit' }
    end
  end
  describe '#update' do
    let!(:user) { create(:user) }
    context 'ログイン前' do
      before { patch user_path user, params: { user: { name: 'name', email: 'email@example.com', slack_id: '', password: 'hogehoge', password_confirmation: 'hogehoge' } } }
      it { expect(response).to redirect_to login_path }
    end
    context '更新成功' do
      before do
        log_in_as user
        patch user_path user, params: { user: { name: "name", email: "email@example.com", slack_id: "slack_id", password: "hogehoge", password_confirmation: "hogehoge" } }
      end
      it { expect(response).to redirect_to user_path user }
    end
    context '更新失敗' do
      before do
        log_in_as user
        patch user_path user, params: { user: { name: " ", email: " ", slack_id: " ", password: " ", password_confirmation: " " } }
      end
      it { expect(response).to render_template 'edit' }
      it { expect(response.response_code).to eq 200 }
    end
  end
end
