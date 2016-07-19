class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reports_of_user_report.subject
  #
  def reports_of_user_report manager, reports
    @reports = reports
    mail to: manager.user.email, subject: I18n.t("mailer.reports.subject")
  end

  def reports_of_user_request admin, users
    @users = users
    mail to: admin.email, subject: I18n.t("mailer.requests.subject")
  end

  def reports_of_least_report admin, users
    @users = users
    mail to: admin.email, subject: I18n.t("mailer.least_reports.subject")
  end
end
