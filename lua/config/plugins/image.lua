return {
	"3rd/image.nvim",
	event = "VeryLazy",
	build = false, -- Prevents building the rock
	opts = {
		processor = "magick_cli",
		backend = "kitty", -- or "ueberzug" depending on your terminal
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = true,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { "markdown", "vimwiki" },
			},
			html = {
				enabled = false,
			},
			css = {
				enabled = false,
			},
		},
		max_width = 80,
		max_height = nil,
		max_width_window_percentage = nil,
		max_height_window_percentage = 50,
		window_overlap_clear_enabled = true,
		editor_only_render_when_focused = true,
		tmux_show_only_in_active_window = true,
		hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
	},
}


