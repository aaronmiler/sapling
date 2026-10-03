module Api
  class PingsController < BaseController
    def index
      render json: PingBlueprint.render(Ping.new("pong", Time.current))
    end
  end
end
