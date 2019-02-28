class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'
 
  def job_email(email,user)
  	@user = user
    #@created_by = post.user
    mail(to: email, subject: 'Applied for the job')  
  end

  def cancel_email(email,user)
  	@user = user
  	#@created_by = post.user
    mail(to: email, subject: 'Job Canceled')
  end

end
