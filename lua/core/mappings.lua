return {
    load_mappings = function(mappings, use_which_key)
        if use_which_key then
            local wk = require("which-key")
            for mode, mapping in pairs(mappings) do
                wk.register(mapping, { mode = mode })
            end
        else
            print("Not using which-key is not supported at the moment")
        end
    end
}
