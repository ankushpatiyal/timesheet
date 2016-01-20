module Underscore

  def self.html(&block)
    html = Underscore::HTML.new(&block)
    if block_given?
      html.instance_eval(&block)
    end
    html.to_html
  end

  class HTML

    def initialize(&block)
      @dom_stack = [{ :name => 'html', :properties => {}, :children => [] }]
    end

    def _(name, properties = {}, &block)
      element = { :name => name.to_s, :properties => properties, :children => [] }
      @dom_stack.last[:children] << element
      @dom_stack.push(element)
      if block_given?
        val = instance_eval(&block)
        if val.is_a?(String)
          @dom_stack.last[:inner_html] = val
        end
      end
      @dom_stack.pop
    end

    def to_html(element=@dom_stack.first)
      html = "<#{element[:name]}"
      for key in element[:properties].keys.sort
        html << %Q{ #{key}="#{element[:properties][key]}"}
      end
      if !element[:children].empty? || element[:inner_html]
        html << '>'
        for child in element[:children]
          html << to_html(child)
        end
        html << "#{element[:inner_html]}</#{element[:name]}>"
      else
        html << '/>'
      end
      html
    end

  end

end
