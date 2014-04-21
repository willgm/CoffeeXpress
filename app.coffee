express = require "express"
path = require "path"
favicon = require "static-favicon"
logger = require "morgan"
cookieParser = require "cookie-parser"
load = require "express-load"
bodyParser = require "body-parser"

app = express()
app.set "views", path.join __dirname, "views"
app.set "view engine", "jade"
app.use favicon()
app.use logger "dev"
app.use bodyParser.json()
app.use bodyParser.urlencoded()
app.use cookieParser()
app.use express.static path.join __dirname, "public"

load 'routes'
    .then 'middleware'
    .into app

app.listen 3000, ->
    console.log 'Running at localhost:3000'
