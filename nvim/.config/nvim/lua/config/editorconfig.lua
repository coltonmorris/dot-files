-- makes fugitive work with this plugin
vim.g.EditorConfig_exclude_patterns = {
	'fugitive://.*',
	'scp://.*',
	"dbui",
	"NvimTree",
	"lspinfo",
	"Mundo",
	"MundoDiff",
	"packer",
	"fugitive",
	"fugitiveblame",
	"NeogitStatus",
	"DiffViewFiles",
}
