#!/usr/bin/python

import random,math
import gtk, gobject

from matplotlib.figure import Figure
from matplotlib.backends.backend_gtkagg import FigureCanvasGTKAgg as FigureCanvas

class ViewerGTK:
  
  hicolor = gtk.gdk.Color(20000,65000,20000)
  locolor = gtk.gdk.Color(65000,65000,65000)

  def __init__(self):
    self.wTree = gtk.Builder()
    self.wTree.add_from_file('viewer/gui.xml')

    dic = { 'on_window_destroy' : self.quit }

    self.wTree.connect_signals(dic)

    f = Figure(figsize=(5,4), dpi=100)
    self.subplot = f.add_subplot(111)
    self.subplot.grid(True)
    self.subplot.plot()
    
    #self.msgls = gtk.ListStore(gobject.TYPE_PYOBJECT,str,str,str,str)
    self.msgls = gtk.ListStore(str,str,str,str)
    self.wTree.get_object('tv_messages').set_model(self.msgls)
    

    for colit,colname in enumerate(['device','message','value']):
      cell = gtk.CellRendererText()
      col = gtk.TreeViewColumn(colname,cell)
      col.add_attribute(cell,'text',colit+1)
      self.wTree.get_object('tv_messages').append_column(col)

    self.canvas = FigureCanvas(f)
    self.wTree.get_object('hbox').add(self.canvas)
    
    self.wTree.get_object('window').set_default_size(640,480)
    self.wTree.get_object('window').show_all()
    
    gobject.timeout_add(500, self.timer_callback)
    
    self.rows = {}
    self.values = {}

    self.dbg = 0

  def data_callback(self, data):
    dev = data['device']
    msg = data['message']
    date = data['date']

    for vname, value in data['values']:
      xs = '%s_%s'%(msg.name,vname)
      if xs in self.values:
        self.values[xs].append( (date,value) )
        if len(self.values[xs]) > 100:
          self.values[xs].pop(0)
      else:
        self.values[xs] = [(date,value)]
        self.rows[xs] = self.msgls.append((dev.name,msg.name,vname,xs))

  def twilite_callback(self, xs):
    self.msgls[ self.rows[xs] ][0] = self.locolor

  def timer_callback(self):
    self.subplot.cla()

    for vs in self.values.values():
      pt = [ d for (d,v) in vs]
      pv = [ v for (d,v) in vs]
      self.subplot.plot(pt, pv, 'r')

    self.canvas.draw()
    return True

  def quit(self, widget):
    gtk.main_quit()

