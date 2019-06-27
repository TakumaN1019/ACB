class ApplicationMailer < ActionMailer::Base
  default from: "TakumaN <acb@takuman.me>" #SESの場合
  layout 'mailer'
end
