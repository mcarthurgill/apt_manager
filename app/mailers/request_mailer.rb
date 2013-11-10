class RequestMailer < ActionMailer::Base
  default to: ["mickgill2008@gmail.com", "mcarthur.gill@gmail.com"],
          from: 'maintenance_request@thirdstreetcapital.com'

  def maintenance(maintenance_request)
  	@maintenance_request = maintenance_request
    mail(subject: "New Maintenance Request")
  end
end
