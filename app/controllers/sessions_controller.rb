class SessionsController < ApplicationController
    def create
        client_id = "88d1a08a1bda6a44edfc"
        client_secret = ENV["client_secret"]
        code = params[:code]
        response = 
        Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")
        parse(response)
        token = @response_hash["access_token"]
        oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
        auth_info = JSON.parse(oauth_response.body)
    end

    private

    def parse(response)
        pairs = response.body.split("&")
        @response_hash = {}
        pairs.each do |pair|
            key, value = pair.split("=")
            @response_hash[key] = value
        end
    end 
end