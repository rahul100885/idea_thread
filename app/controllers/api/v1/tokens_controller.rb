class Api::V1::TokensController < ApplicationController

  # Token authentication
  # curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"email":"rahul100885@gmail.com","password":"bapu123"}'  http://localhost:3000/api/v1/tokens

  # Token signout
  # curl -v -H "Accept: application/json" -H "Content-type: application/json" -X DELETE -d '{}'  http://localhost:3000/api/v1/tokens/rT4KWeprJoysXJhvhQN1

  # Get all or single idea
  # curl -v -H "Accept: application/json" -H "Content-type: application/json" -X GET -d '{"auth_token":"9qVqacoG5oSQvxNPqeiy"}'  http://localhost:3000/ideas

  # Create an Idea
  #curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"auth_token":"9qVqacoG5oSQvxNPqeiy", "title" :"Idea From API", "description" :"This is demo from API for description"}'  http://localhost:3000/ideas

    skip_before_filter :verify_authenticity_token
    respond_to :json
    def create
      email = params[:email]
      password = params[:password]
      if request.format != :json
        render :status=>406, :json=>{:message=>"The request must be json"}
        return
       end

    if email.nil? or password.nil?
       render :status=>400,
              :json=>{:message=>"The request must contain the user email and password."}
       return
    end

    @user=User.find_by_email(email.downcase)

    if @user.nil?
      logger.info("User #{email} failed signin, user cannot be found.")
      render :status=>401, :json=>{:message=>"Invalid email or passoword."}
      return
    end

    # http://rdoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable
    @user.ensure_authentication_token!

    if not @user.valid_password?(password)
      logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
      render :status=>401, :json=>{:message=>"Invalid email or password."}
    else
      render :status=>200, :json=>{:token=>@user.authentication_token}
    end
  end

  def destroy
    @user=User.find_by_authentication_token(params[:id])
    if @user.nil?
      logger.info("Token not found.")
      render :status=>404, :json=>{:message=>"Invalid token."}
    else
      @user.reset_authentication_token!
      render :status=>200, :json=>{:token=>params[:id]}
    end
  end

end

