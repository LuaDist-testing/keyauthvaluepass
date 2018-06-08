-- This file was automatically generated for the LuaDist project.

package = "keyauthvaluepass"
version = "1.5-4"
-- LuaDist source
source = {
  tag = "1.5-4",
  url = "git://github.com/LuaDist-testing/keyauthvaluepass.git"
}
-- Original source
-- source = {
--     url = "git://github.com/jhitzke/key-auth-value-pass",
--     tag = "1.5-4"
-- }
description = {
    summary = "Pass a value via custom_id using key-auth, using a given prefix",
    license = "MIT/X11"
}
dependencies = {
    "lua ~> 5.1"
}
build = {
    type = "builtin",
    modules = {
        ["kong.plugins.key-auth-value-pass.handler"] = "src/handler.lua",
        ["kong.plugins.key-auth-value-pass.schema"] = "src/schema.lua"
    }
}