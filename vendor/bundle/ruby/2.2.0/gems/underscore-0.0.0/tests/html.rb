require File.join(File.dirname(__FILE__), 'tests_helper')

Shindo.tests('html') do

  test('empty') do
    US.html == '<html/>'
  end

  test('nested elements') do
    html = US.html do
      _('head') do
        _('title') { 'nested' }
      end
    end
    html == '<html><head><title>nested</title></head></html>'
  end

  test('element with property') do
    html = US.html do
      _('div', 'class' => 'foo') { 'content' }
    end
    html == '<html><div class="foo">content</div></html>'
  end

  test('element with properties') do
    html = US.html do
      _('div', 'class' => 'foo', 'id' => 'bar') { 'content' }
    end
    html == '<html><div class="foo" id="bar">content</div></html>'
  end

end