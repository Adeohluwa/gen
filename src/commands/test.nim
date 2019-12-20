import os
import re
import sugar
import tables
import strformat
import strutils
import fab
import docopt



let writeTest = (content: string) => writeFile("tRoutes.nim",content)

var buildUp = """
import unittest
import httpclient



let client = newHttpClient()
client.headers = newHttpHeaders({"Content-Type":"application/json"})


suite "Tests all the routes":
"""




proc genTest*(args: Table[system.string, docopt.Value]) =
  for filename in @(args["<file>"]):

    let pattern = rex(r"get.+ | post.+ | put.+ | patch.+ |delete.+ ")

    let contents = readFile(filename)
    let matchObjects = contents.findAll(pattern)

    for each in matchObjects:
      let reqMethod = each.findAll(re(r"post|get|put|patch|delete"))[0]
      let url = each.findAll(re(r"/.+"))[0].replace(":","")
      buildUp.add(&"\n\n\n  test \"{url}:\n      check:  client.{reqMethod}(\"{url}) == Http500") 


    writeTest(buildUp)
