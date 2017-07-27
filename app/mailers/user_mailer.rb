class UserMailer < ApplicationMailer
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

  def password_reset(user)
    @user = user

    mail to: user.email, subject: "【ulima】パスワード再設定のご案内"
  end
end
