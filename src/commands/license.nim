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
      
      of "apache":
        exec &"cp $(nimble path gen)/templates/license/apache.txt ./License.txt"
      
      of "mozilla":
        exec &"cp $(nimble path gen)/templates/license/mozilla.txt ./License.txt"
      
      of "gpl3":
        exec &"cp $(nimble path gen)/templates/license/gnugpl3.txt ./License.txt"

      of "unilicense":
        exec &"cp $(nimble path gen)/templates/license/unilicense.txt ./License.txt"
      
      else:
        red "sorry i don't have that license :("
