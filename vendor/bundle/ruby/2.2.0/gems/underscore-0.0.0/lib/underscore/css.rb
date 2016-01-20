module Underscore

  def self.css(&block)
    css = Underscore::CSS.new(&block)
    if block_given?
      css.instance_eval(&block)
    end
    css.to_css
  end

  class CSS

    def initialize(&block)
      @selector_stack = []
      @styles = {}
    end

    def _(name, properties = {}, &block)
      @selector_stack.push(name.to_s)
      (@styles[@selector_stack.join(' ')] ||= {}).merge!(properties)
      if block_given?
        instance_eval(&block)
      end
      @selector_stack.pop
    end

    def to_css
      css = ''
      for selector in @styles.keys.sort
        unless @styles[selector].empty?
          css << "#{selector}{"
          for key, value in @styles[selector]
            css << "#{key}:#{value};"
          end
          css.chop!
          css << "}"
        end
      end
      css
    end

  end

end
