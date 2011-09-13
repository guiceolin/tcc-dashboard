class Notifications < ActionMailer::Base
  default :from => "notifications@ceol.in"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.messages.subject
  #
  def messages(user, count)
    @count = count 
    @user = user

    mail :to => user.email 
  end
end
