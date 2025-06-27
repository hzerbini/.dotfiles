local M = {}

M.templates = {
    person = {
        birthdate = "YYYY-MM-DD",
        deathdate = "YYYY-MM-DD",
        birthplace = "---",
        languages = { "---" },
        relationships = { "---" },
    },
    artwork = {
        year = "YYYY",
        author = "--- (relation)",
    },
    quote = {
        year = "YYYY",
        author = "--- (relation)",
    },
    cheatsheet = {
        of = "---",
    },
    city = {
        country = "---",
    },
}

M.get_fields_by_tags = function(tags)
    local result = {}
    for _, tag in ipairs(tags or {}) do
        local template = M.templates[tag]
        if template then
            for k, v in pairs(template) do
                result[k] = v
            end
        end
    end
    return result
end

return M
