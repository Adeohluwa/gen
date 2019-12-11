import jester
import ../controllers/users

# router name is the name of your url prefix
router routerName:
  ## /user
  post "/user/create":
    resp "works"

  get "/user/online":
    resp "works"
 


  ## /package
  post "/package/send":
    resp "works"
  post "/package/deliver":
    resp "works"
 


  ## /review
  get "/review/":
    resp "works"
  post "/review":
    resp "works"
   
 

  ## /booking
  post "/booking/create":
    resp "works"
  post "/booking/cancel":
    resp "works"

 

  ## /contact
  get "/contact":
    resp "works"



  ## /delivery
  get "/delivery/track":
    resp "works"
  post "/delivery/confirm":
    resp "works"
