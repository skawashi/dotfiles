local mason = require("mason")

mason.setup({
  ui = {
    icons = {
     package_installed = "✓",
     package_pending = "➜",
     package_uninstalled = "✗"
    }
  }
})

vim.api.nvim_create_user_command("MasonUpgrade", function()
	local registry = require("mason-registry")
	registry.refresh()
	registry.update()
	local packages = registry.get_all_packages()
	for _, pkg in ipairs(packages) do
		if pkg:is_installed() then
			pkg:install()
		end
	end
	vim.cmd("doautocmd User MasonUpgradeComplete")
end, { force = true })
