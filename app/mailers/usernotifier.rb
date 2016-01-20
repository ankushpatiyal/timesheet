class UserNotifier < ActionMailer::Base
 default :from => "ankushpatiyal@gmail.com"

def send_signup_email(home)
@home=home
mail(:from => "ankushpatiyal@gmail.com", :to =>  @home.name, :subject => "Welcome to 1 Support Ticket")
end

end
