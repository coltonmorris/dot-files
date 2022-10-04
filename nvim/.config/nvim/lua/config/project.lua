-- TODO have a way to search through protos for neo projects. Will likely need a custom telescope picker?
require("projectmgr").setup {
    autogit = false,
    reopen = false, -- reopen last opened project
    session = { enabled = true, file = "Session.vim" },
    shada = { enabled = false, file = "main.shada" },
    scripts = {
        enabled = true,
        file_startup = "startup.sh",
        file_shutdown = "shutdown.sh",
    },
}
