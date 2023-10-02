# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    path = env['PATH_INFO']
    if path == '/' || path == '/about'
      status = 200
      body  = 'string'
    else
      status = 404
      body = 'text'
    end
    headers = { 'Context-Type' => 'text/plain'}
    [status, headers, [body]]
    # END
  end
end
