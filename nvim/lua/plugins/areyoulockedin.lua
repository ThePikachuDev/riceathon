return {
	"voltycodes/areyoulockedin.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		require("areyoulockedin").setup({
			session_key = "084c40de-0af0-4ef4-ab7e-3510b379159a",
		})
	end,
}
