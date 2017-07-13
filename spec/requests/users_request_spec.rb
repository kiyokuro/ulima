require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let!(:user){create(:user)}
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
      it{expect(user.valid?).to eq true}
    end
    context '名前が空' do
      before{user.name = ''}
      it{expect(user.valid?).to eq false}
    end
  end
end
