class UsersController < ApplicationController
layout 'home'  
require 'bcrypt'
  def index
  end

  def signin
    redirect_to myprofile_path unless session[:main_id].nil?
  end

  def create
  	@user = User.find_by_email(params[:email])
    if !@user.nil?
    password = BCrypt::Password.new(@user.password_hash) unless @user.nil?
      if !@user.nil? && password == params[:password]
        session[:main_id] = @user.id
        redirect_to myprofile_path
      else
        flash[:notice] = 'Your login attempt was not successful. Please try again'
        redirect_to signin_path
      end
    else
      checkpf params
    end  
  end

  def myprofile
   if session[:main_id].nil? 
      redirect_to signin_path, :notice => "Please sign in"
    else
     
    end 
  end

  def change
   @changeme = User.find(session[:main_id]) 
  end

  def details 
    @user = User.find(session[:main_id])
    @details = Refprofile.find_by_email(@user.email)
  end

  def changedet
    @mypf = Refprofile.find_by_email(User.find(session[:main_id]).email)
    @mypf.name = params[:refprofile][:name]
    @mypf.location = params[:refprofile][:location]
    @mypf.google_profile = params[:refprofile][:google_profile]
    @mypf.linkedin_profile = params[:refprofile][:linkedin_profile]
    @mypf.facebook_profile = params[:refprofile][:facebook_profile]
    @mypf.content = params[:refprofile][:content]
    @mypf.save
    redirect_to changedetails_path
  end
 
  def changeput
   @user = User.find(session[:main_id])
    @curpass = BCrypt::Password.new(@user.password_hash)
     if @curpass == params[:change_password][:current_password] 
       @user.password_hash = BCrypt::Password.create(params[:change_password][:password])
       if @user.save
        flash[:notice] = 'Password Changed Successfully'
        redirect_to changepwd_path
       else
        flash[:notice] = 'Something went wrong , Please consult administrator'
        redirect_to changepwd_path
       end
     else     
       flash[:notice] = 'Please check your current password'    
       redirect_to changepwd_path
     end   
  end

  def useremail

    unless User.find_by_email(params['email']).nil?

         @user=User.find_by_email(params['email'])        
         @mail=UserMailer.forgot_email(@user).deliver
         flash[:notice]="Please reset password go through your mail"
         redirect_to forgetpwd_path

    else
    flash[:notice] ='You Enter Email Is Wrong'
    redirect_to forgetpwd_path
    end
  end

  def changepwd

  end

  def updatepassword
    
    if params['password'] == params['conformpassword']

       @user=User.find_by_id(params[:user_id])
       @user.password_hash = BCrypt::Password.create(params[:password])
       if @user.save
        flash[:notice] = 'Password Changed Successfully'
        redirect_to signin_path
      end
    else
      flash[:notice]="Newpassword and conformpassword doesnot match"

      # binding.pry
      redirect_to :controller => :users, :action => :changepwd, :id => params['user_id']
    end

  end

  def destroy
  	session[:main_id] = nil
  	redirect_to root_url
  end


  
  private
    def checkpf params
       unless Refprofile.find_by_email(params[:email]).nil?
         if params[:password] == "default"
            my_password = BCrypt::Password.create("default") 
            @fresh = User.new(:email => params[:email], :password_hash => my_password)
            if @fresh.save
              session[:main_id] = @fresh.id
              redirect_to myprofile_path
            end
         else
          flash[:notice] = 'Please Login With Default Password Provided'
          redirect_to signin_path
         end
       else
          flash[:notice] = 'Your login attempt was not successful. Please try again'
          redirect_to signin_path
       end
    end  
end
