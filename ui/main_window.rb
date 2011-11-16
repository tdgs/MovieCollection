# encoding: utf-8
require 'Qt'
require_relative 'info_tab'
require_relative '../qt_views/tableview'
require_relative 'ui_files/main_window_ui'
require_relative 'progress_dialog'
require_relative '../lib/dir_scanner'

class MainWindow < Qt::MainWindow
  def initialize(parent = nil)
    super(parent)
  end

  def setup_ui
    @ui = Ui::MainWindow.new
    @ui.setup_ui(self)
    @ui.addDir.connect(SIGNAL :clicked) {self.add_dir}
  end

  def add_dir
    path = Qt::FileDialog::getExistingDirectory(self, 'Συλλογή Ταινιών', Dir.home)
    return if path.nil?

    dir_scanner = DirScanner.new(path)
    progress = ProgressDialog.new(self, 'Ανάγνωση Φακέλου', 100)
    progress.update(0, '0')
    dir_scanner.add_observer(progress)
    dir_scanner.scan
    # progress = ProgressDialog.new('Εισαγωγή Στη Βάση Δεδομένων...', movies.count)
    # movies.each do |m|
    #   status = 0
    #   Movie.from_imdb(m).save
    #   progress.update(status, m.title)
    #   status += 1
    #   break if progress.wasCancelled
    # end

  end

end
