local langs = {"rust", "python"}

for _,lang in ipairs(langs) do
	vim.g[lang .. "_recommended_style"] = 0
end

