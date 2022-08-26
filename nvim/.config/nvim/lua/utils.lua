local export = {}

function export.formatFilenameToPlzPath()
    local file = vim.api.nvim_buf_get_name(0)

    -- splitBySlash lets us know the length of the string.gmatch command
    local splitBySlash = {}
    for ele in string.gmatch(file, "[^/]+") do
        table.insert(splitBySlash, ele)
    end


    if table.getn(splitBySlash) <= 1 then
        print("encountered a weird filename: ", file)
        return
    end

    local plzPath = "/"
    local isAfterProjectRoot = false
    local i = 0
    for ele in string.gmatch(file, "[^/]+") do
        -- do not count the last element because its the filename
        if i == table.getn(splitBySlash) then
            break
        end

        if isAfterProjectRoot and i ~= table.getn(splitBySlash)-1 then
            plzPath = plzPath .. "/" .. ele
        end

        if ele == "neo" then
            isAfterProjectRoot = true
        end

        i = i + 1
    end

    -- open the terminal in the top because the "bottom" directive only does on the vsplit, but the top runs across the whole screen no matter what
    cmd = "top split | resize 20 | term plz build "

    -- TODO ideally we just find the project root rather than look for neo. can look for .git starting at splitBySlash[table.getn(splitBySlash)]
    if isAfterProjectRoot then
        cmd = cmd .. plzPath
    end

    vim.api.nvim_command(cmd)
end

return export
