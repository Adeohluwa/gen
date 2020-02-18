import osproc
from os import sleep

when defined(windows):
  const apiBin = "$name.exe"
else:
  const apiBin = "$name"

var apiProc: Process 

proc startApi*() = 
  apiProc = startProcess(apiBin)
  sleep(100)

proc stopApi*() = 
  while apiProc.running:
    apiProc.kill()
  apiProc.close()

startApi()
try:
  discard execCmd("nimble test")  
except Exception:
  echo getCurrentException().msg

stopApi()