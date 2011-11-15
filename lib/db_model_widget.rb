# encoding: utf-8
require 'Qt'

class MyTextEdit < Qt::TextEdit
  def initialize(parent = nil)
    super(parent)
    self.acceptRichText = false
  end
	def text
		self.plainText
	end
	def text=(val)
		self.plainText = val.to_s
	end
end

module DataBaseModelWidget
	
	attr_accessor :attributes
	attr_accessor :ui
	attr_accessor :item
	
	def load_from_db
		attributes.each do |attr|
			puts  "loading  #{attr}: #{item.send(attr)}"
			@ui.send(attr).text = item.send(attr)
		end
		load_relationships
	end
	
	def save_to_db
		attributes.each do |attr|
			item.send(attr.to_s + '=', @ui.send(attr).text) 
		end
		item.save
	end
	
	def item=(i)
	  @item = i
	  load_from_db
	end
	
	def load_relationships
	end
	
	def save
		box = Qt::MessageBox.new
		msg = (save_to_db and 'Οι αλλαγές αποθηκεύτηκαν') || 'Υπήρξε κάποιο πρόβλημα στην αποθήκευση'
		box.text = msg
		box.exec
	end
end
