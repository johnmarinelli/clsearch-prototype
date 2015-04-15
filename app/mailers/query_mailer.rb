class QueryMailer < ApplicationMailer
  default from: "john.marinelli.dev@gmail.com"
  
  def query_mail(user, json)
    @json = json
    mail(to: user.email, subject: 'Your query results')
  end
end
