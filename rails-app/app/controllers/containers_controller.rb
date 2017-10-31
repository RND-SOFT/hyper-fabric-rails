class ContainersController < ApplicationController
  before_action :set_container, only: [:show, :edit, :update, :destroy]
  include ActionController::Live

  def index
    @containers = Container.all
  end

  def up
    exec_byfn "up"
  end

  def down
    exec_byfn "down"
  end

  private
  
  def exec_byfn action
    response.headers['Content-Type'] = "text/event-stream"
    begin
      IO.popen("cd ../hyperledger-simple-app/ && ./byfn.sh -m #{action}") do |io|
        while true
          # NOTE: Sending to the stream until EOFError drops out
          response.stream.write(io.sysread(4096))
        end
      end
    rescue EOFError => e
      puts e.inspect
    end
  ensure
    response.stream.close
  end

end
