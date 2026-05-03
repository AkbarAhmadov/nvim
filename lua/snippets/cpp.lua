local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets_dir = vim.fn.stdpath("config") .. "/lua/snippets/cpp"

local function load_snippet(trigger)
  local path = snippets_dir .. "/" .. trigger .. ".cpp"
  local file = io.open(path, "r")
  if not file then return nil end
  local lines = {}
  for line in file:lines() do
    table.insert(lines, line)
  end
  file:close()
  return lines
end

local function make_snippet(trigger)
  local lines = load_snippet(trigger)
  if not lines then return nil end

  local cursor_line, cursor_col
  for li, line in ipairs(lines) do
    local col = line:find("{{CURSOR}}", 1, true)
    if col then
      cursor_line = li
      cursor_col = col
      break
    end
  end

  if not cursor_line then
    return s(trigger, { t(lines) })
  end

  local before = {}
  for li = 1, cursor_line - 1 do
    table.insert(before, lines[li])
  end
  local cursor_row = lines[cursor_line]
  local pre  = cursor_row:sub(1, cursor_col - 1)
  local post = cursor_row:sub(cursor_col + #"{{CURSOR}}")
  table.insert(before, pre)

  local after = { post }
  for li = cursor_line + 1, #lines do
    table.insert(after, lines[li])
  end

  return s(trigger, { t(before), i(0), t(after) })
end

local triggers = {
  "cd",
  "call_imptreap",
  "call_lca",
  "call_seg",
  "call_bit",
  "call_press",
  "call_line",
  "call_seg_int",
  "call_lct",
  "call_pragmas",
  "call_dsu",
  "call_impseglazy",
}

local result = {}
for _, trigger in ipairs(triggers) do
  local snip = make_snippet(trigger)
  if snip then
    table.insert(result, snip)
  end
end

ls.add_snippets("cpp", result)
