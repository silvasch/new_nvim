function flatten(input)
    local out = {}

    for k, v in pairs(input) do
        if type(v) == "table" then
            for k, v in pairs(flatten(v)) do
                out[k] = v
            end
        else
            out[k] = v
        end
    end

    return out
end

return flatten
