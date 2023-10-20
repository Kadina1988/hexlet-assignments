# frozen_string_literal: true

class SetLocaleMiddleware
  attr_reader :request

  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    @request = Rack::Request.new(env)

    I18n.locale = set_locale(@request)

    @status, @headers, @body = @app.call(env)
  end

  private

  def set_locale(request)
    http_request = request.env['HTTP_ACCEPT_LANGUAGE']
    lang_array = if http_request.nil?
                   nil
                 else
                   http_request.split(',')
                 end

    if lang_array.nil?
      I18n.default_locale
    else
      lang_array[0].to_sym
    end
  end
  # END
end
