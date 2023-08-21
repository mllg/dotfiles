local fn = vim.fn
local files = vim.split(fn.glob(vim.fn.stdpath("config") .. "/spell/*.add"), "\n")

for _, file in ipairs(files) do
  local spl = file .. ".spl"
  if (fn.filereadable(file) and not fn.filereadable(spl)) or (fn.getftime(file) > fn.getftime(spl)) then
    vim.cmd("mkspell! " .. file)
  end
end
