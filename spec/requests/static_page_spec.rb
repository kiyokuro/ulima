require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "GET home" do
    before { get :home }
    context 'ログイン前のユーザ' do
      it { expect(response).to be_success }
      it { expect(response).to render_template('home') }
    end
    context 'ログイン済みのユーザ' do
    end
  end
end
