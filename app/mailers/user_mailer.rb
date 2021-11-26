class UserMailer < ApplicationMailer
  def registration_notification
    @user = params[:user]
    mail(to: @user.email, subject: 'Good to see you as part of our fidelity plan family!')
  end
end
