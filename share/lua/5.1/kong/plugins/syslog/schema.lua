local typedefs = require "kong.db.schema.typedefs"

local severity = {
  type = "string",
  default = "info",
  one_of = { "debug", "info", "notice", "warning", "err", "crit", "alert", "emerg" },
}

return {
  name = "syslog",
  fields = {
    { protocols = typedefs.protocols },
    { config = {
        type = "record",
        fields = {
          { log_level = severity },
          { successful_severity = severity },
          { client_errors_severity = severity },
          { server_errors_severity = severity },
          { custom_fields_by_lua = typedefs.lua_code },
    }, }, },
  },
}

