import os

proc getProjectName*(): string =
  for file in walkFiles("*.nimble"):
    if result != "":
        echo "multiple .nimble files found. Using sample name 'app'"
        result = "app"
        break
    result = file.splitFile.name
  if result == "":
    echo "no .nimble files found. Using sample name 'app'"
    result = "app"