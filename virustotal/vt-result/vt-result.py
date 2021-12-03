# Using Python2

from cefpython3 import cefpython as cef
import sys
import os

sys.excepthook = cef.ExceptHook  # To shutdown all CEF processes on error
cef.Initialize()
cef.CreateBrowserSync(url='file://' + os.getcwd() + '/vt.html', window_title='Virustotal Report').ToggleFullscreen()
cef.MessageLoop()
cef.Shutdown()
