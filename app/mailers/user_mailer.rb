class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user

    mail to: user.email, subject: "【ulima】メールアドレス認証のご案内"
  end

  def notice_sell_item(order_user, item)
    @order_user = order_user
    @item = item
    @sell_user = User.find(@item.user_id)

    mail to: @sell_user.email, subject: "【ulima】#{@item.name}の取引のご案内"
  end

  def notice_buy_item(order_user, item)
    @order_user = order_user
    @item = item
    @sell_user = User.find(@item.user_id)

    mail to: order_user.email, subject: "【ulima】#{@item.name}の取引のご案内"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end