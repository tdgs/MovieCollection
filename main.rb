require_relative 'db_models'
require_relative 'ui/main_window.rb'
require_relative 'ui'


lang = Qt::Locale::Greek
country = Qt::Locale::Greece
Qt::Locale.setDefault(Qt::Locale.new(lang, country))

app = Qt::Application.new(ARGV)
#Qt.debug_level = Qt::DebugLevel::High


$mainWindow = MainWindow.new
$mainWindow.setup_ui
$mainWindow.show
app.exec
