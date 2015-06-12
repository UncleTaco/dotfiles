local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"

-- going to try and make this golden ratio hotkey
hotkey.bind({"cmd", "alt", "ctrl"}, "d", function()
    local win = window.focusedwindow()
    local f = win:frame()
)
