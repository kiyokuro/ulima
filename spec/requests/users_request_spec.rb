require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { build(:user, params) }
  describe '#create' do
    context 'ユーザ作成できたとき' do
      # before{post :create, params:{name: 'yamada', email: 'yamada@y.com', slack_id: '', password: 'hogehoge', password_confirmation: 'hogehoge'}}
      # it {expect(response).to redirect_to(root_url)}
    end
    context 'ユーザ作成できないとき' do
      # before{post signup_path, params:{name: '', email: '', password: '', password_confirmation: ''}}
      # it{expect(response).to render_template('new')}
    end
  end

  describe 'バリデーション' do
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
    context 'emailがフォーマットと異なる' do
      let!(:params) { { email: 'hoge@com' } }
      it { expect(user.valid?).to eq false }
      let!(:params) { { email: 'hoge@hoge..com' } }
      it { expect(user.valid?).to eq false }
      let!(:params) { { email: 'hoge.com' } }
      it { expect(user.valid?).to eq false }
    end
  end
end
