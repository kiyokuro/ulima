require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let!(:user) { create(:user) }

  describe "#account_activation" do
    let(:mail) { UserMailer.account_activation(user) }

    context "header" do
      # it{expect(mail.subject).to eq("【ulima】メールアドレス認証のご案内")}
      # it{expect(mail.to).to eq([user.email])}
      # it{expect(mail.from).to eq(['ulima.noreply@gmail.com'])}
    end

    context "body" do
      # it{expect(mail.body.encoded).to match("こちらは会員登録のご案内です。")}
    end
  end

  describe '#norice_sell_item' do
    let!(:item) { create(:item) }
    let(:mail) { UserMailer.notice_sell_item(user, item) }

    context 'header' do
      it { expect(mail.subject).to eq("【ulima】#{item.name}の取引のご案内") }
      it { expect(mail.to).to eq([User.find(item.user_id).email]) }
      it { expect(mail.from).to eq(['ulima.noreply@gmail.com']) }
    end

    context 'body' do
      # it{expect(mail.body.encoded).to match("#{item.name}の取引のご案内です。")}
    end
  end

  describe '#norice_buy_item' do
    let!(:item) { create(:item) }
    let(:mail) { UserMailer.notice_sell_item(user, item) }

    context 'header' do
      it { expect(mail.subject).to eq("【ulima】#{item.name}の取引のご案内") }
      it { expect(mail.to).to eq([user.email]) }
      it { expect(mail.from).to eq(['ulima.noreply@gmail.com']) }
    end

    context 'body' do
      # it{expect(mail.body.encoded).to match("#{item.name}の取引のご案内です。")}
    end
  end

  #    describe "password_reset" do
  #      let(:mail) { UserMailer.password_reset }
  #
  #      it "renders the headers" do
  #        expect(mail.subject).to eq("Password reset")
  #        expect(mail.to).to eq(["to@example.org"])
  #        expect(mail.from).to eq(["from@example.com"])
  #      end
  #
  #      it "renders the body" do
  #        expect(mail.body.encoded).to match("Hi")
  #      end
  #    end
end
