import * as MarkdownCls from 'markdown/lib/markdown.js'

const markdown = {
  Markdown: MarkdownCls,
  parse: MarkdownCls.parse,
  toHTML: MarkdownCls.toHTML,
  toHTMLTree: MarkdownCls.toHTMLTree,
  renderJsonML: MarkdownCls.renderJsonML
}

export { markdown }
