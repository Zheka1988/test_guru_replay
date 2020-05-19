class FeedbacksMailer < ApplicationMailer

  default to: -> { Admin.pluck(:email) }

  def feedback(feedback)
    @feedback = feedback

    mail(from: @feedback.user.email, subject: t('.subject'))
  end
end
