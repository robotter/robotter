#!/usr/bin/python
import gtk
from viewer.fetcher import TelemetryFetcher
from viewer.gui import ViewerGTK

if __name__ == '__main__':
  
  hw = ViewerGTK()
  tm = TelemetryFetcher('/dev/ttyUSB0',38400)

  tm.callback = hw.data_callback
  tm.start()

  gtk.main()

  tm.quit()
