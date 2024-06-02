-- see https://ejmastnak.com/tutorials/vim-latex/luasnip/ for details.

-- Abbreviations
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- tex specific environments

local tex_utils = {}
tex_utils.in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
  return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function() -- itemize environment detection
  return tex_utils.in_env("itemize")
end
tex_utils.in_enumerate = function() -- enumerate environment detection
  return tex_utils.in_env("enumerate")
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
  return tex_utils.in_env("tikzpicture")
end

-- general stuff

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end
-- snippets

return {

  -- Generic environment
  s(
    { trig = "new", snippetType = "autosnippet", dscr = "Begin new environment." },
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
      ]],
      {
        i(1),
        d(2, get_visual),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),

  -- equation*

  s(
    { trig = "eq", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{equation*}
        <>
      \end{equation*}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- theorem

  s(
    { trig = "thm", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{theorem}
        <>
      \end{theorem}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- lemma

  s(
    { trig = "lem", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{lemma}
       <>
      \end{lemma}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- proposition

  s(
    { trig = "prop", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{proposition}
       <>
      \end{proposition}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- corollary

  s(
    { trig = "cor", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{corollary}
       <>
      \end{corollary}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- example

  s(
    { trig = "eg", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{example}
        <>
      \end{example}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- proof

  s(
    { trig = "prf", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{proof}
       <>
      \end{proof}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- definition

  s(
    { trig = "dfn", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{definition}
       <>
      \end{definition}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- enumerate
  s(
    { trig = "enum", snippetType = "autosnippet" },
    fmta(
      [[
        \begin{enumerate}

            \item <>

        \end{enumerate}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  -- ENUMERATE ADD ITEM

  -- inline math
  s(
    { trig = "([^%l])mm", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>$<>$", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),

  -- inline math on new line
  s(
    { trig = "^mm", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("$<>$", {
      i(1),
    })
  ),
}
