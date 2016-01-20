module Underscore

  def self.http(&block)
    Underscore::HTTP.new(&block)
  end

  class HTTP

    def initialize(&block)
      @path_stack = []
      @routes = {}
      if block_given?
        instance_eval(&block)
      end
      @finished = true
      self
    end

    def _(path, options = {}, &block)
      return if @finished
      options = { :method => 'GET' }.merge!(options)
      case path
      when Regexp
        @path_stack.push(path.source)
      when String
        @path_stack.push(Regexp.escape(path))
      end
      @routes[options[:method]] ||= []
      @routes[options[:method]] << [/^#{@path_stack.join('/').squeeze('/')}$/ix, block]
      if block_given?
        instance_eval(&block)
      end
      @path_stack.pop
    end

    def call(env)
      for route in @routes[env['REQUEST_METHOD']]
        if match = route[0].match(env['PATH_INFO'])
          response = Rack::Response.new(route[1].call(*match.captures))
          break
        end
      end
      unless response
        response = Rack::Response.new('Page Not Found')
        response.status = 404
      end
      response.finish
    end

  end

end
