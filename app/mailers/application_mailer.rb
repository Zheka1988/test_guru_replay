class ApplicationMailer < ActionMailer::Base
  default from: %{'TestGuru' <testguru@mail.ru> }
  layout 'mailer'
end
