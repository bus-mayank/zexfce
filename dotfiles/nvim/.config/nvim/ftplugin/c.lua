-- Compile and run the current C file with F5
local function compile_and_run()
  vim.cmd("write")

  local cmd = "gcc -Wall -Wextra % -o %< && ./%<"

  -- reuse split if it's already open, otherwise create one
  if vim.g.c_run_win and vim.api.nvim_win_is_valid(vim.g.c_run_win) then
    vim.api.nvim_set_current_win(vim.g.c_run_win)
    vim.cmd("terminal " .. vim.fn.expandcmd(cmd))
    vim.cmd("startinsert")
  else
    vim.cmd("belowright split | terminal " .. vim.fn.expandcmd(cmd))
    vim.g.c_run_win = vim.api.nvim_get_current_win()
    vim.cmd("startinsert")
  end
end

vim.keymap.set("n", "<F5>", compile_and_run, { buffer = true, desc = "Compile and run C file" })
