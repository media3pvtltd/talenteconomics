class UserMailer < ActionMailer::Base
  default from: "info33.plgaonline@gmail.com"

  def contact_email(user)
    binding.pry
      @user = user
      mail( :to => @user["email"], :subject => 'Talent Economics  :: Requesting Helpline Acknowledgement').deliver!
  end
  def support_email(user)

      @user = user
      mail( :from => @user["email"], :to => "info33.plgaonline@gmail.com", :subject => "Mail From #{@user['first_name']}" ).deliver!
  end
  def forgot_email(user)
    @user = user
    mail( :to => @user["email"], :subject => 'Talenteconomics :: ForgotPassword')
  end

end
