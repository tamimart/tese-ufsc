local pandoc = require("pandoc")

function Para(el)
  if #el.content == 1 and el.content[1].t == "Image" then
    local img = el.content[1]
    local legend = img.attr.attributes["legend"]
    if legend then
      local caption_block = pandoc.RawBlock("latex",
        "\\textbf{TESTE LEGENDA:} " .. legend)
      return {el, caption_block}
    end
  end
  return nil
end

function CodeBlock(el)
  local legend = el.attributes["legend"]
  if legend then
    local blocks = {
      el,
      pandoc.RawBlock("latex", "\\textbf{TESTE LEGENDA:} " .. legend)
    }
    return blocks
  end
  return nil
end