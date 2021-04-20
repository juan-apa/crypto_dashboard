(function(win, doc, $) {
  const { themeSettings, layoutHelpers, attachMaterialRipple, detachMaterialRipple, SideNav } = win
  let [ firstLoad, sidenavInstance ] = [ true, null ]

  doc.addEventListener('turbo:before-render', e => {
    if (!themeSettings || $('html')[0].hasAttribute('data-turbolinks-preview')) return

    // Remove unwanted merged stylesheets on each render
    $('.theme-settings-bootstrap-css').slice(1).remove()
    $('.theme-settings-appwork-css').slice(1).remove()
    $('.theme-settings-theme-css').slice(1).remove()
    $('.theme-settings-colors-css').slice(1).remove()

    // Setup theme settings element
    if (!firstLoad) {
      $('.layout-wrapper', e.data.newBody).addClass('layout-sidenav-link-no-transition')
      themeSettings.updateNavbarBg(e.data.newBody)
      themeSettings.updateSidenavBg(e.data.newBody)
      themeSettings.updateFooterBg(e.data.newBody)
      themeSettings._setup(e.data.newBody)
      setTimeout(() =>
        $('.layout-wrapper', e.data.newBody).removeClass('layout-sidenav-link-no-transition')
      , 50)
    }
  })

  doc.addEventListener('turbo:load', () => {
    if (layoutHelpers) {
      layoutHelpers.init()

      // Update layout
      layoutHelpers.update()

      // Auto update layout
      layoutHelpers.setAutoUpdate(true)

      // Hide sidenav on small screens after page load
      if (layoutHelpers.isSmallScreen()) {
        layoutHelpers.setCollapsed(true, true)
      }
    }

    // Attach material ripple
    if (!firstLoad && attachMaterialRipple && $('html').hasClass('material-style')) {
      attachMaterialRipple()
    }

    // Initialize sidenav
    $('#layout-sidenav').each(function () {
      sidenavInstance = new SideNav(this, {
        orientation: $(this).hasClass('sidenav-horizontal') ? 'horizontal' : 'vertical'
      })
    })

    // Initialize sidenav togglers
    $('body').on('click', '.layout-sidenav-toggle', e => {
      e.preventDefault()
      layoutHelpers.toggleCollapsed()
    })

    // Swap dropdown menus in RTL mode
    if ($('html').attr('dir') === 'rtl') {
      $('#layout-navbar .dropdown-menu').toggleClass('dropdown-menu-right')
    }
  })

  doc.addEventListener('turbo:visit', () => {
    firstLoad = false

    // Clean up layoutHelpers
    if (layoutHelpers) {
      layoutHelpers.destroy()
    }

    // Clean up material ripple
    if (detachMaterialRipple) {
      detachMaterialRipple()
    }

    // Destroy sidenav
    if (sidenavInstance) {
      sidenavInstance.destroy()
    }

    // Remove sidenav toggler listeners
    $('body').off('click', '.layout-sidenav-toggle')
  })
})(window, document, jQuery)
