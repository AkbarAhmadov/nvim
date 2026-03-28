local map = vim.keymap.set
local CF_USER = "Ekber_Ekber"

map("n", "<leader>g", function()
  local curl = require("plenary.curl")
  local ok, result = pcall(curl.get, "https://codeforces.com/api/user.status?handle=" .. CF_USER .. "&from=1&count=1")

  if not ok or not result or result.status ~= 200 then
    vim.notify("Network Error!", vim.log.levels.ERROR, { title = "Codeforces" })
    return
  end

  local data_ok, data = pcall(vim.json.decode, result.body)
  if not data_ok or data.status ~= "OK" then
    vim.notify("Couldn't load data!", vim.log.levels.ERROR, { title = "Codeforces" })
    return
  end

  local sub     = data.result[1]
  local verdict = sub.verdict
  local problem = sub.problem.name
  local time    = sub.timeConsumedMillis .. " ms"
  local mem     = math.floor(sub.memoryConsumedBytes / 1024) .. " KB"

  if not verdict or verdict == "TESTING" then
    vim.notify("Running...", vim.log.levels.INFO, { title = "Codeforces" })
    return
  end

  local msg, level
  if verdict == "OK" then
    msg   = "AC, Good Job. Lets get one more."
    level = vim.log.levels.INFO
  elseif verdict == "WRONG_ANSWER" then
    msg   = "WA, Oh no. Its time to debugging"
    level = vim.log.levels.WARN
  elseif verdict == "TIME_LIMIT_EXCEEDED" then
    msg   = "TLE, Too late."
    level = vim.log.levels.WARN
  elseif verdict == "RUNTIME_ERROR" then
    msg   = "RE, Borders are tight."
    level = vim.log.levels.ERROR
  elseif verdict == "MEMORY_LIMIT_EXCEEDED" then
    msg   = "MLE, your memory is exceeded."
    level = vim.log.levels.WARN
  elseif verdict == "COMPILATION_ERROR" then
    msg   = "CE, Learn how to write a code!"
    level = vim.log.levels.ERROR
  else
    msg   = verdict
    level = vim.log.levels.INFO
  end

  vim.notify(
    string.format("%s\n%s\n⏱ %s | 💾 %s", problem, msg, time, mem),
    level,
    { title = "Codeforces" }
  )
end, { desc = "CF last verdict" })
