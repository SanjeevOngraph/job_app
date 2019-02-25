class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'
 
  def job_email(post,user)
  	@user = user
    @created_by = post.user
    mail(to: @created_by.try(:email), subject: 'Applied for the job')  
  end

  def cancel_email(post,user)
  	@user = user
  	@created_by = post.user
    mail(to: @created_by.try(:email), subject: 'Job Canceled')
  end

end
