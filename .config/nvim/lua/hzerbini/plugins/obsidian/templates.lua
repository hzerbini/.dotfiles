local M = {}

M.templates = {
    ["type/person"] = {
        birthdate = "YYYY-MM-DD",
        deathdate = "YYYY-MM-DD",
        birth_place = "---",
        death_place = "---",
        nationality = "---",
        occupation = {"---"},
        known_for = {"---"},
        associated_with = {"---"},
        languages = {"---"},
        fictional = false,
        gender = "male",
        image = "https://",
        description = "https://",
    },
    ["type/manga"] = {
        author = "---",
        genres= {"---", "---"},
        demographic = "---",
        status = "#status/plan-to-read",
        chapters_read = 0,
        volumes_read = 0,
        start_date = "YYYY-MM-DD",
        end_date = "YYYY-MM-DD",
        serialization = "---",
        publisher = "---",
        rating = 10,
        language = "japanese",
        cover_image = "---",
        mal_id = 13,
        mal_url = "https://",
        description = "---",
    },
    ["type/course"] = {
        of = "---",
        name = "---",
        author = "---",
        my_rating = 10,
        image = "---",
    },
    ["type/chapter"] = {
        of = "---",
        name = "---",
        number = 3,
        my_rating = 10,
        image = "---",
        places = { "---" , "---"},
    },
    ["type/artwork"] = {
        year = "YYYY",
        author = "---",
        current_location = "---",
        painted_where = "---",
        image = "---",
    },
    ["type/continent"] = {
        image = "---",
        map_image = "---",
    },
    ["type/city"] = {
        country = "---",
        state = "---",
        population = 1111,
        area_km2 = 11111,
        known_for = {"---", "---"},
        flag = "---",
        image = "---",
        map_image = "---",
        founded = "YYYY-MM-DD"
    },
    ["type/state"] = {
        country = "---",
        flag = "---",
        image = "---",
        map_image = "---",
        founded = "YYYY-MM-DD"
    },
    ["type/country"] = {
        languages = {"---"},
        president = "---",
        capital = "---",
        continent = "---",
        population = 100,
        area_km2 = 100,
        currency = "---",
        government_type = "---",
        flag = "---",
        image = "---",
        map_image = "---",
        founded = "YYYY-MM-DD",
    },
    ["type/location"] = {
        location_type = "# e.g., city, park, mountain, landmark, region, building, neighborhood, river",
        country = "---",
        state = "---",
        city = "---",
        coordinates = {
            lat = 36.1666,
            lon = -111,
        },
        description = "---",
        image = "---",
        map_image = "---",
    },
    ["attribute/ficticional"] = {
        fictional = true,
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
