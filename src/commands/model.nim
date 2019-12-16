import tables
import strformat
import strutils
import fab
import docopt
import run

proc genModel*(args: Table[system.string, docopt.Value]) =
  let text = """
import os
import norm/postgres
import dotenv

let env  = initDotEnv()
env.load()

let host = getEnv("host")
let dbname = getEnv("db")
let username = getEnv("user")
let password = getEnv("pass")

# edit existing models
# or add your models under the type section
# possible types are int | float | bool | string
db(host,username,password,dbname):
  type
    Profile* = object
      name: string
      pass: string
      phone: string
      country: string
    
    Review* = object
      name: string
      rating: int
      comment: string 
    
    Suggestions* = object
      phone: string
      comment: string


when isMainModule:
  withDb:
    createTables()
"""
  for filename in @(args["<model>"]):
    writeFile(&"{filename}", text)
