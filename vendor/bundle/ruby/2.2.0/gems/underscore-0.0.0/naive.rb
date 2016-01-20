require File.join(File.dirname(__FILE__), 'lib/underscore')

def greeter(greeting, source)
  US.html do
    _('head') do
      _('title') { 'underscore does the right thing' }
      _('link', 'charset' => 'utf-8', 'href' => 'styles.css', 'media' => 'all', 'rel' => 'stylesheet', 'type' => 'text/css')
    end
    _('body') do
      _('h1') { "#{greeting} from #{source}" }
    end
  end
end

router = US.http do

  _('/') do

    _('styles.css') do
      US.css do
        _('body', 'background-color' => '#EEE', 'text-align' => 'center')
        _('h1', 'color' => '#666', 'font-size' => '1.5em')
      end
    end

    _(/(.*)_from_(.*)/) do |greeting, name|
      greeter(greeting, name)
    end

    greeter('hello', 'underscore')

  end

end

Rack::Handler::WEBrick.run(router, :Port => 9292)
