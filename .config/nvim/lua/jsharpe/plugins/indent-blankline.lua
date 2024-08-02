return {
   "lukas-reineke/indent-blankline.nvim",
   main = "ibl",
   config = function()
      require("ibl").setup {
         indent = { char = '┊' },
         -- show_trailing_blankline_indent = false,
      }
   end
}
