local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox     =  "duskfox",
  alt_nc  =  true,
  styles = {
    comments   =  "italic",
    keywords   =  "bold",
    functions  =  "italic,bold"
  }
})
nightfox.load()
