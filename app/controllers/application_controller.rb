class ApplicationController < ActionController::Base
	protect_from_forgery prepend: true

  def hello
    render html: "hello, world!"
  end

end
