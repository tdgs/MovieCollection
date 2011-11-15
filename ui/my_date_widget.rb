require 'Qt'

class MyDateWidget < Qt::DateEdit
	
	def initialize(parent = nil)
		super(parent)
		self.displayFormat = 'dd/MM/yyyy'
	end
  
  def text
		Date.parse(self.date.toString(Qt::ISODate))
  end
	
	def text=(date)
		date = date.to_s if date.is_a? Date
		self.date = Qt::Date.fromString(date, Qt::ISODate)
	end
end
