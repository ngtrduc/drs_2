class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reports_of_user_report.subject
  #
  def reports_of_user_report manager, reports
    @manager = manager
    @reports = reports
    mail to: @manager.user.email, subject: I18n.t("mailer.reports.subject")
  end
end
