return {
	"tpope/vim-rhubarb",
	event = { "BufRead", "BufNewFile" },
	dependencies = {
		"tpope/vim-fugitive",
	},
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>gg", vim.cmd.GBrowse)
		keymap.set("n", "<leader>gb", ":Git blame<CR>")
	end,
}
