import tables
import strformat
import strutils
import fab
import docopt
import run


proc genLicense*(args: Table[system.string, docopt.Value]) =
  for license in @(args["<license>"]):
    case license.toLower():
      of "mit":
        exec &"cp $(nimble path gen)/templates/license/mit.txt ./License.txt"
      
      of "bsd":
        exec &"cp $(nimble path gen)/templates/license/bsd.txt ./License.txt"
      
      of "cc0":
        exec &"cp $(nimble path gen)/templates/license/cc.txt ./License.txt"
 
      of "apache":
        exec &"cp $(nimble path gen)/templates/license/apache.txt ./License.txt"
      
      of "mozilla":
        exec &"cp $(nimble path gen)/templates/license/mozilla.txt ./License.txt"
      
      of "gpl":
        exec &"cp $(nimble path gen)/templates/license/gnugpl3.txt ./License.txt"

      of "unlicense":
        exec &"cp $(nimble path gen)/templates/license/unlicense.txt ./License.txt"
      
      else:
        red "sorry i don't have that license :("
