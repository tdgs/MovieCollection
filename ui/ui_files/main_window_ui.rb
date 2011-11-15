# encoding: utf-8
=begin
** Form generated from reading ui file 'main_window.ui'
**
** Created: Tue Nov 15 18:47:08 2011
**      by: Qt User Interface Compiler version 4.7.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_MainWindow
    attr_reader :centralwidget
    attr_reader :gridLayout_2
    attr_reader :tabWidget
    attr_reader :menubar
    attr_reader :statusbar
    attr_reader :dockWidget_2
    attr_reader :dockWidgetContents_2
    attr_reader :gridLayout
    attr_reader :label
    attr_reader :addDir
    attr_reader :tableView

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(954, 600)
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.objectName = "centralwidget"
    @gridLayout_2 = Qt::GridLayout.new(@centralwidget)
    @gridLayout_2.objectName = "gridLayout_2"
    @tabWidget = InfoTabWidget.new(@centralwidget)
    @tabWidget.objectName = "tabWidget"
    @tabWidget.tabsClosable = true

    @gridLayout_2.addWidget(@tabWidget, 0, 0, 1, 1)

    mainWindow.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 954, 21)
    mainWindow.setMenuBar(@menubar)
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.objectName = "statusbar"
    mainWindow.statusBar = @statusbar
    @dockWidget_2 = Qt::DockWidget.new(mainWindow)
    @dockWidget_2.objectName = "dockWidget_2"
    @dockWidgetContents_2 = Qt::Widget.new(@dockWidget_2)
    @dockWidgetContents_2.objectName = "dockWidgetContents_2"
    @gridLayout = Qt::GridLayout.new(@dockWidgetContents_2)
    @gridLayout.objectName = "gridLayout"
    @gridLayout.setContentsMargins(0, 0, 0, 0)
    @label = Qt::Label.new(@dockWidgetContents_2)
    @label.objectName = "label"

    @gridLayout.addWidget(@label, 0, 0, 1, 1)

    @addDir = Qt::PushButton.new(@dockWidgetContents_2)
    @addDir.objectName = "addDir"

    @gridLayout.addWidget(@addDir, 0, 1, 1, 1)

    @tableView = MovieTable.new(@dockWidgetContents_2)
    @tableView.objectName = "tableView"

    @gridLayout.addWidget(@tableView, 1, 0, 1, 2)

    @dockWidget_2.setWidget(@dockWidgetContents_2)
    mainWindow.addDockWidget((1), @dockWidget_2)

    retranslateUi(mainWindow)
    Qt::Object.connect(@tableView, SIGNAL('edit_request(QVariant)'), @tabWidget, SLOT('edit_item(QVariant)'))

    @tabWidget.setCurrentIndex(-1)


    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def setup_ui(mainWindow)
        setupUi(mainWindow)
    end

    def retranslateUi(mainWindow)
    mainWindow.windowTitle = my_translate("MainWindow", nil)
    @label.text = my_translate("\316\243\317\205\316\273\316\273\316\277\316\263\316\256", nil)
    @addDir.text = my_translate("\316\240\317\201\316\277\317\203\316\270\316\256\316\272\316\267 \316\232\316\261\317\204\316\261\316\273\317\214\316\263\316\277\317\205..", nil)
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

