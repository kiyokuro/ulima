class EmailValidator < ActiveModel::Validator
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@/
  # [a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def validate(user)
    mail_account = user.email.split('@')[0] + '@'
    mail_domain = user.email.split('@')[1]
    unless mail_account.match(VALID_EMAIL_REGEX) && mail_domain.eql?(Ulima::Application.config.mail_domain)
      user.errors.add(:base, "メールアドレスが正しくありません。メールのドメインが「" + Ulima::Application.config.mail_domain + "」のもののみ登録できます。")
    end
  end
end
