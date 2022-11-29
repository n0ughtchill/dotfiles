local status, _ = pcall(vim.cmd.colorscheme, "catppuccin-frappe")
if not status then
	print("Colorscheme not found!")
	return
end
