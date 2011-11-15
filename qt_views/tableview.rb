# encoding: utf-8
require_relative '../qt_models'
require 'Qt4'
require_relative '../lib/ruby_variant.rb'
require 'launchy'

class BasicTable < Qt::TableView
  class << self; 
    attr_accessor :deleteMessage, :deleteActionText;
  end
  @deleteMessage = 'generic message'
  @deleteActionText = 'generic text'

  slots "edit_item(const QModelIndex&)", "new_item()", "item_remove(bool)"
  signals "edit_request(QVariant&)"
  def initialize(parent = nil, model = nil)
    super(parent)

    setModel(model) if model

    sizePolicy = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Expanding)
    self.sortingEnabled = true
    self.selectionBehavior = Qt::AbstractItemView::SelectRows
    self.selectionMode = Qt::AbstractItemView::ExtendedSelection
    self.alternatingRowColors = true

    @removeAction = Qt::Action.new(self.class.deleteActionText, self)
    icon = Qt::Icon.new
    icon.addPixmap(Qt::Pixmap.new(":/images/user-group-delete.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @removeAction.icon = icon
    @removeAction.enabled = false
    self.addAction(@removeAction)




    self.connect(SIGNAL('activated(const QModelIndex&)'), self, :edit_item)
    Qt::Object.connect(@removeAction, SIGNAL('triggered(bool)'), self, SLOT('item_remove(bool)'))
    Qt::Object.connect(self, SIGNAL('edit_request(QVariant&)'), $mainWindow, SLOT('edit_item(QVariant&)'))

    @selected = []
  end

  def selectionChanged(selected, deselected)
    @selected = selected
    if selected.count == 0
      @removeAction.enabled = false
    else
      @removeAction.enabled = true
    end
    super(selected, deselected)
  end

  def edit_item(index)
    item = self.model.itemFromIndex(index)
    emit edit_request(item.to_variant)
  end

  def contextMenuEvent(event)
    menu = Qt::Menu.new(self)
    menu.addAction(@removeAction) if self.indexAt(event.pos).valid?
    menu.exec(event.globalPos) unless menu.isEmpty
    menu.dispose
  end

  def items_from_indexes(indexes)
    indexes.collect {|idx| self.model.itemFromIndex(idx)}
  end

  def selected_items
    items_from_indexes self.selectionModel.selectedRows(0)
  end

  def all_items
    self.model.all_items
  end

  def item_remove(checked)
    indexes = self.selectionModel.selectedRows(0)
    models = indexes.collect {|idx| self.model.itemFromIndex(idx)}
    question = Qt::MessageBox.new
    question.text = self.class.deleteMessage
    question.standardButtons = Qt::MessageBox::Ok | Qt::MessageBox::Cancel
    if question.exec == Qt::MessageBox::Ok
      box = Qt::MessageBox.new
      if self.model.remove_items models
        box.text = 'Τα στοιχεία Διαγράφησαν'
      else
        box.text = 'Υπήρξε ένα πρόβλημα με τη διαγραφή'
      end
      box.exec
    end


  end

end

class MovieTable < BasicTable
  def initialize(parent = nil, collection = nil)
    super(parent, MovieModel.new(collection))
  end
end


