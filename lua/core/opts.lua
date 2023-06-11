return {
	load_opts = function(opts)
		for k, v in pairs(opts) do
			vim.opt[k] = v
		end
	end,
	load_gs = function(g)
		for k, v in pairs(g) do
			vim.g[k] = v
		end
	end,
}
