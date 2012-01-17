class NominationMailer < ActionMailer::Base
  default from: "from@example.com"


  def nomination_confirmation(user, nominee, committee)
    @user = user
    @nominee = nominee
    @committee = committee

    mail(to: user.email, subject: "Your nomination has been received")
  end
  def nomination_notification(nominee, committee)
    @nominee = nominee
    @committee = committee

    mail(to: nominee.email, subject: "You've been nominated to be on a Student Government Committee")
  end
  def application_confirmation(user, committee)
    @user = user
    @committee = committee

    mail(to: user.email, subject: "Application Received")
  end
end
