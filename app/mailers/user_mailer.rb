class UserMailer < ActionMailer::Base
  default from: "info@dilegno.sg"

  def test_email(user)
  	mail(to: 'pohchiat@gmail.com', subject: 'Invitation to Di Legno Opening')
  end

  def contact_us(user_email, subject, message)
  	mail(from: user_email, reply_to: user_email, to: "info@dilegno.sg", subject: subject) do |format|
  		format.text { render text: message}
  	end
  end
end
