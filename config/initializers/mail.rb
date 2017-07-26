if Rails.env.production?
  ActionMailer::Base.default_url_options = { host: "#{ENV['HEROKU_APP_NAME']}.herokuapp.com" }
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.smtp_settings = {
    enable_starttls_auto: true,
    address: 'smtp.gmail.com',
    port: '587',
    domain: 'smtp.gmail.com',
    authentication: 'plain',
    user_name: ENV['MAIL_SERVER_NAME'],
    password: ENV['MAIL_SERVER_PASSWORD']
  }
elsif Rails.env.development?
  host = 'localhost:3000'
  ActionMailer::Base.default_url_options = { host: host, protocol: 'http' }
  ActionMailer::Base.delivery_method = :letter_opener
else
  host = 'localhost:3000'
  ActionMailer::Base.default_url_options = { host: host, protocol: 'http' }
  ActionMailer::Base.delivery_method = :test
end
