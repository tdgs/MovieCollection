class SearchOptionHash < Hash
	def initialize(optsArray)
		optsArray.each {|field| self[field[0]] = SearchOption.new(field[1], field[2])}
	end
	
	def to_search_hash
		options = Hash.new
		self.each do |k, v|
			value = v.value
			if value.is_a? Array
				options[k.send(:gte)] = value[0] unless value[0].nil?
				options[k.send(:lte)] = value[1] unless value[1].nil?
			else
				options[k.send(:like)] = "%#{value}%" unless value.nil? or value.empty?
			end
		end
		return options
	end

  def to_attributes
    attrs = Hash.new
    self.each do |k, v|
      value = v.value
      attrs[k] = value unless value.is_a? Array
    end
    return attrs
  end
end




class SearchOption
	attr_accessor :widget, :valueMethod, :validationMethod
	
	def initialize(widget, args = Hash.new)
		@widget = widget
		args ||= Hash.new
		@valueMethod = args[:value] || :text
		@validationMethod = args[:validation] || :modified
	end
	
	def value
		(@widget.is_a? Array and @widget.map {|w| widget_value(w)}) || widget_value(@widget)
	end
	
	def widget_value(widget) 
		(widget.send(@validationMethod) and widget.send(@valueMethod)) || nil
	end
end
