require File.join(File.dirname(__FILE__), 'tests_helper')

Shindo.tests('css') do

  test('empty') do
    css = US.css
    css == ''
  end

  test('selector without properties') do
    css = US.css do
      _('div')
    end
    css == ''
  end

  test('selector with properties') do
    css = US.css do
      _('div', 'display' => 'none')
    end
    css == 'div{display:none}'
  end

end
