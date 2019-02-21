class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'
 
  def apply_job_email(post)
    @created_by = post.user
    mail(to: @created_by.try(:email), subject: 'Applied for the job')  
  end

  def cancel_email(post)
  	@created_by = post.user
    mail(to: @created_by.try(:email), subject: 'Applied for the job')
  end

end
