class SessionsController < ApplicationController
    def create
        response = gh_request_response
        parse(response)
        @token = @response_hash["access_token"]
        oauth_response = Faraday.get("https://api.github.com/user?access_token=#{@token}")
        auth_info = JSON.parse(oauth_response.body)
        save_user(auth_info)
        redirect_to dashboard_path
    end

    private

    def gh_request_response
        client_id = ENV["client_id"]
        client_secret = ENV["client_secret"]
        code = params[:code]
        response = 
        Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")
    end

    def parse(response)
        pairs = response.body.split("&")
        @response_hash = {}
        pairs.each do |pair|
            key, value = pair.split("=")
            @response_hash[key] = value
        end
    end 

    def save_user(user_info)
        user = User.find_or_create_by(uid: user_info["id"])
        user.username = user_info["login"]
        user.uid = user_info["id"]
        user.token = @token
        user.save
        session[:user_id] = user.id 
    end
end