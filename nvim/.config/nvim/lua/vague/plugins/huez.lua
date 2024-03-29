return {
    "vague2k/huez.nvim",
    dev = true,
    config = function()
        require("huez").setup({
            -- the filepath where your theme will be saved
            file_path = vim.fs.normalize(vim.fn.stdpath("config")) .. "/.nvim.huez.lua",
            -- the fallback theme in case Huez fails or bugs out for some reason
            fallback = "default",
            -- a list of ugly theme that come with neovim that you probably don't want to choose from in the picker
            omit = {
                "default",
                "desert",
                "evening",
                "industry",
                "koehler",
                "morning",
                "murphy",
                "pablo",
                "peachpuff",
                "ron",
                "shine",
                "slate",
                "torte",
                "zellner",
                "blue",
                "darkblue",
                "delek",
                "quiet",
                "elflord",
                "habamax",
                "lunaperche",
            },
            -- optional: by default, picker will be vim.ui.select, you can also choose "telescope"
            picker = "telescope",
            -- optional: only applies if using telescope, picker_opts controls the dropdown style
            picker_opts = require("telescope.themes").get_dropdown({}),
        })

        local colorscheme = require("huez.api").get_colorscheme()
        vim.cmd("colorscheme " .. colorscheme)

        vim.keymap.set("n", "<leader>co", ":Huez<CR>", {})
    end,
}
