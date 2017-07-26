require 'rails_helper'

RSpec.describe ItemsController, type: :request do
  let!(:user) { create(:user) }
  describe '#new' do
    context 'ログインされていなければログインページにリダイレクト' do
      before { get registrate_path }
      it { expect(response).to redirect_to(login_url) }
    end
    context 'アイテム登録フォームにアクセス' do
      before do
        log_in_as(user)
        get registrate_path
      end
      it { expect(response).to render_template('new') }
    end
  end

  describe '#create' do
    let!(:item_param) { attributes_for(:item) }
    context 'ログインされていなければログインページにリダイレクト' do
      before { post registrate_path, params: { item: item_param } }
    end
    context 'アイテムが登録された' do
      before do
        log_in_as(user)
        post registrate_path, params: { item: item_param }
      end
      it { expect(response).to redirect_to(root_path) }
    end
    context 'アイテムの登録に失敗した' do
      before do
        log_in_as(user)
        post registrate_path, params: { item: { name: " ", description: " ", price: "100", quantity: "1", show_enable: true } }
      end
      it { expect(response).to render_template('new') }
    end
  end
  describe 'バリデーション' do
    let!(:item) { build(:item, params) }
    context '正しい入力' do
      let!(:params) { {} }
      it { expect(item.valid?).to eq true }
    end
    context 'タイトルが空' do
      let!(:params) { { name: " " } }
      it { expect(item.valid?).to eq false }
    end
    context '説明が空' do
      let!(:params) { { description: " " } }
      it { expect(item.valid?).to eq false }
    end
  end
  describe '#edit' do
    let!(:item) { create(:item) }
    context 'ログイン前' do
      before { get edit_item_path item }
      it { expect(response).to redirect_to login_path }
    end
    context 'ログイン後' do
      before do
        log_in_as user
        get edit_item_path item
      end
      it { expect(response).to render_template 'edit' }
    end
  end
  describe '#update' do
    let!(:item) { create(:item) }
    context 'ログイン前' do
      before { put item_path item }
      it { expect(response).to redirect_to login_path }
    end
    context '更新が成功' do
      before do
        log_in_as user
        patch item_path item, params: { item: { name: "name", description: "description", price: "100", quantity: "1", show_enable: true, picture: "picture" } }
      end
      it { expect(response).to redirect_to user_path user }
    end
    context '更新が失敗' do
      before do
        log_in_as user
        patch item_path item, params: { item: { name: " ", description: " ", price: '100', quantity: "1", show_enable: true, picture: "picture" } }
      end
      it { expect(response).to render_template 'edit' }
    end
  end
end
