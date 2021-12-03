from cefpython3 import cefpython as cef
import sys

sys.excepthook = cef.ExceptHook  # To shutdown all CEF processes on error
cef.Initialize()
cef.CreateBrowserSync(url='https://cuckoo.ee', window_title='Cuckoo Sandbox').ToggleFullscreen()
cef.MessageLoop()
cef.Shutdown()