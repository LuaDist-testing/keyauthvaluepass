local constants = require "kong.constants"
local responses = require "kong.tools.responses"
local BasePlugin = require "kong.plugins.base_plugin"

local set_header = ngx.req.set_header

local KeyAuthValuePassHandler = BasePlugin:extend()


function KeyAuthValuePassHandler:new()
    KeyAuthValuePassHandler.super.new(self, "key-auth-value-pass")
end

function KeyAuthValuePassHandler:header_filter(config)
    KeyAuthValuePassHandler.super.header_filter(self)

    local custom_id = get_headers()[constants.HEADERS.CONSUMER_CUSTOM_ID]

    -- Ensure the custom_id begins with the configured prefix
    if not string.starts(custom_id, config.prefix)
        return responses.send_HTTP_UNAUTHORIZED("API key not authorized for this API")
    end

    -- Filter the custom_id from the consumer to remove the configured prefix
    local retrieved_value = string.sub(custom_id, string.len(config.prefix) + 1)
    set_header(config.header_name, retrieved_value)
end

return KeyAuthValuePassHandler