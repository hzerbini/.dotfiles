local s = require("luasnip.nodes.snippet").S
local sn = require("luasnip.nodes.snippet").SN
local isn = require("luasnip.nodes.snippet").ISN
local t = require("luasnip.nodes.textNode").T
local i = require("luasnip.nodes.insertNode").I
local f = require("luasnip.nodes.functionNode").F
local c = require("luasnip.nodes.choiceNode").C
local d = require("luasnip.nodes.dynamicNode").D
local r = require("luasnip.nodes.restoreNode").R
local events = require("luasnip.util.events")
local k = require("luasnip.nodes.key_indexer").new_key
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = require("luasnip.nodes.multiSnippet").new_multisnippet

return {
    s({ trig = "schema", name = "Schema block (create/table)", dscr = "Miolo do Schema::create ou Schema::table" },
        c(1, {
          -- Opção 1: Schema::create
          sn(nil, fmt([[
    Schema::create('{tbl}', function (Blueprint $table) {{
        $table->id();
        {body}
        $table->timestamps();
    }});
    ]], {
            tbl  = i(1, "table_name"),
            body = i(0, "// $table->string('name');"),
          })),

          -- Opção 2: Schema::table (alterar)
          sn(nil, fmt([[
    Schema::table('{tbl}', function (Blueprint $table) {{
        {body}
    }});
    ]], {
            tbl  = i(1, "table_name"),
            body = i(0, ""),
          }))
        })
      ),
}
