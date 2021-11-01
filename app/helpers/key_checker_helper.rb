module KeyCheckerHelper
  def sendgrid_key_present?
    return true if Rails.application.credentials.sendgrid[:password]

    false
  end
end
