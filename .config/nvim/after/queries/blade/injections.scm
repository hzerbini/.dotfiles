((text) @injection.content
   (#not-has-ancestor? @injection.content "envoy")
   (#not-has-parent? @injection.content  "comment")
   (#set! injection.combined)
   (#set! injection.language php))
