const resolve = require('path').resolve
const { environment } = require('@rails/webpacker')
const RenameWebpackPlugin = require('rename-webpack-plugin')
const FixStyleOnlyEntriesPlugin = require('webpack-fix-style-only-entries')

// ============================================================================
// Collect entries

const getFiles = ext => {
  return require('glob').sync(`vendor/assets/*/**/!(_)*.${ext}`, {
    cwd: resolve(__dirname, '../..')
  }) || []
}

const collectJavascriptEntries = () => {
  return getFiles('js').reduce((entries, file) => {
    const filePath = file.replace(/\\/g, '/')
    return {
      ...entries,
      [filePath.replace('/assets/', '/').replace('/javascripts/', '/').replace(/\.js$/, '')]: `./${filePath}`
    }
  }, {})
}

const collectStylesheetEntries = () => {
  return getFiles('@(scss|css)').reduce((entries, file) => {
    const filePath = file.replace(/\\/g, '/')
    return {
      ...entries,
      [filePath.replace('/assets/', '/').replace('/stylesheets/', '/').replace(/\.s?css$/, '')]: `./${filePath}`
    }
  }, {})
}

const collectEntries = () => {
  const js = collectJavascriptEntries()
  const css = collectStylesheetEntries()

  const result = { ...js }

  Object.keys(css).forEach(p => {
    if (result[p]) {
      result[p] = [css[p]].concat(result[p])
    } else {
      result[p] = css[p]
    }
  })

  return result
}

// ============================================================================
// Inject resolve-url-loader

environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader'
})

// ============================================================================
// HTML loader

environment.loaders.append('vendor-html', {
  test: /\.html$/,
  use: [{
    loader: 'html-loader',
    options: { minimize: true }
  }],
  include: [
    resolve(__dirname, '../../vendor/assets')
  ]
})

// ============================================================================
// Inject plugins

environment.plugins.insert('RenameVendors',
  new RenameWebpackPlugin({
    originNameReg: /^(.*(?:\/|\\)vendor(?:\/|\\))javascripts(?:\/|\\)(.*)$/,
    targetName: '$1$2'
  })
, { before: 'manifest' })

// Remove style-only entries only in vendor/assets
environment.plugins.insert('RemoveStyleOnlyEntries',
  new FixStyleOnlyEntriesPlugin({
    ignore: /webpack-hot-middleware|(?!(?:\/|\\)vendor(?:\/|\\)assets(?:\/|\\))/
  })
, { before: 'manifest' })

// ============================================================================
// Config

module.exports = {
  target: 'web',
  output: {
    libraryTarget: 'window'
  },
  entry: {
    ...collectEntries()
  },
  externals: {
    'jquery': 'jQuery',
    'moment': 'moment',
    'datatables.net': '$.fn.dataTable',
    'spin.js': 'Spinner',
    'jsdom': 'jsdom',
    'd3': 'd3',
    'eve': 'eve',
    'velocity': 'Velocity',
    'hammer': 'Hammer',
    'raphael': 'Raphael',
    'mapael': 'Mapael',
    'jquery-mapael': 'Mapael',
    'pace': '"pace-progress"',
    'popper.js': 'Popper',
    'mousewheel': 'jquery-mousewheel',
    'googlemaps!': 'google',
    'jquery-validation': 'jQuery',

    // blueimp-file-upload plugin
    'canvas-to-blob': 'blueimpDataURLtoBlob',
    'blueimp-tmpl': 'blueimpTmpl',
    'load-image': 'blueimpLoadImage',
    'load-image-meta': 'null',
    'load-image-scale': 'null',
    'load-image-exif': 'null',
    'jquery-ui/ui/widget': 'null',
    './jquery.fileupload': 'null',
    './jquery.fileupload-process': 'null',
    './jquery.fileupload-image': 'null',
    './jquery.fileupload-video': 'null',
    './jquery.fileupload-validate': 'null',

    // blueimp-gallery plugin
    './blueimp-helper': 'jQuery',
    './blueimp-gallery': 'blueimpGallery',
    './blueimp-gallery-video': 'blueimpGallery'
  }
}
