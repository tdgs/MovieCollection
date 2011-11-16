require 'observer'

class ProgressDialog < Qt::ProgressDialog
  include Observable
  def initialize(parent = nil, title, max)
    super(parent)
    self.maximum = max
    self.window_title = title
    self.minimumDuration = 0
  end

  def update(status, e)
    self.labelText = e.to_s
    self.value = status
  end

  def cancel
    changed
    notify_observers
    super
  end

end
