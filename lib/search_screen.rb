# encoding: utf-8
require_relative '../lib/search'

module ChangeResultTable
  def resultsTable=(table)
    @resultsTable = table
  end
end

module SearchScreen
  def self.included(base)
    base.class_eval do 
      slots 'search()', 'show_all()'
      signals 'edit_request(QVariant&)'
      attr_accessor :optionsHash
      attr_accessor :model, :klass
      attr_accessor :resultsTable
      attr_accessor :ask

      def ask_if_new(attributes)
        msgbox = Qt::MessageBox.new
        msgbox.text = 'Δεν βρέθηκε κανένα αποτέλεσμα. Θέλετε να δημιουργήσετε νέα καρτέλα;'
        msgbox.standardButtons = Qt::MessageBox::Ok | Qt::MessageBox::Cancel
        puts attributes.inspect
        if msgbox.exec == Qt::MessageBox::Ok
          emit edit_request(@klass.new(attributes).to_variant)
        end
      end

      def search
        options = @optionsHash.to_search_hash
        results = @klass.all(options)
        if results.empty? and @ask
          ask_if_new(@optionsHash.to_attributes)
        end
        @ui.resultsTable.model =  model.new(self, klass.all(options))
      end

      def show_all
        @ui.resultsTable.model = model.new(self, klass.all)
      end

      def setResultsTable
        @ui.extend ChangeResultTable
        layout = @ui.resultsTable.parent.layout
        layout_index = layout.index_of(@ui.resultsTable)
        row = Qt::Integer.new(0); col = Qt::Integer.new(0)
        rowspan = Qt::Integer.new(0);colspan = Qt::Integer.new(0);
        
        layout.getItemPosition(layout_index,row, col, rowspan, colspan)
        layout.removeWidget @ui.resultsTable
        @ui.resultsTable.dispose
        @ui.resultsTable = @resultsTableKlass.new(self)
        layout.addWidget(@ui.resultsTable, row, col, rowspan,colspan)
      end
    end
  end
end

