import sugar
import tables
import strformat
import strutils
import fab
import docopt



let dotNim = () => writeFile(
"nim.cfg",
"""
--threads:on
-d:release
"""
)


let dotTravis = () => writeFile(
".travis.yml",
"""
"""
)


let dotEnv = () => writeFile(
".env",
"""
DB_HOST=localhost      
POSTGRES_DB=dbname            
POSTGRES_USER=username
POSTGRES_PASSWORD=password
"""
)


let dotGitignore = () => writeFile(
".gitignore",
"""
.env
bin/
src/models/<yourmodel>
"""
)





proc genConfigs*() =
  dotNim()
  dotTravis()
  dotEnv()
  dotGitignore()

