class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :badge, dependent: :destroy

  after_create :create_badge
  after_create :send_email_registration_notification

  def send_email_registration_notification
    UserMailer.with(user: self).registration_notification.deliver_now
  end
end
