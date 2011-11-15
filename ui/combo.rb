# encoding: utf-8
require 'Qt'
require_relative '../lib/ruby_variant'

class MyCombo < Qt::ComboBox

    def initialize(parent = nil, coll, method)
        super(parent)
        @coll = coll
        @method = method
        load_from_db
        self.editable = true
    end


    def get_item
        puts "CURRENT_INDEX: #{self.currentIndex.inspect}"
        return nil if self.currentIndex == -1
        id = self.itemData(self.currentIndex).value
        @coll.first(:id => id)
    end

    def set_item(item_index)
      combo_index = self.findData(Qt::Variant.new(item_index))
      puts "COMBO_INDEX: #{combo_index}"
      self.currentIndex = combo_index
    end

    def load_from_db
        self.clear
        @coll.all.each {|item| self.addItem(item.send(@method), Qt::Variant.new(item.id))}
        self.currentIndex = -1
        (0..self.count).each do |i|
            puts self.itemData(i).value.inspect
        end

    end

    def collection=(col)
      @coll = col
      load_from_db
    end
end

class DoctorCombo < MyCombo
    def initialize(parent = nil)
        super(parent, Doctor.all, :full_name)
    end
end

class PatientCombo < MyCombo
  def initialize(parent = nil, patients = Patient.all)
    super(parent, patients, :full_name)
  end
end

