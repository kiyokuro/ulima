class EmailValidator < ActiveModel::Validator
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def validate(user)
    unless user.email.match(VALID_EMAIL_REGEX) then
      user.errors.add(:base, "メールアドレスが正しくありません")
    end
  end
end
