import * as blueimpGallery from 'blueimp-gallery/js/blueimp-gallery.js'

if ($('html').attr('dir') === 'rtl' || $('body').attr('dir') === 'rtl') {
  const galleryTranslateX = blueimpGallery.prototype.translateX

  blueimpGallery.prototype.translateX = function (index, x, speed) {
    const newX = this.touchStart && this.touchStart.x ? x : -1 * x
    galleryTranslateX.call(this, index, newX, 0, speed)
  }

  blueimpGallery.prototype.positionSlide = function (index) {
    const slide = this.slides[index]

    slide.style.width = `${this.slideWidth}px`

    if (this.support.transform) {
      const moveTo = this.index > index
        ? (-1 * this.slideWidth)
        : (this.index < index ? this.slideWidth : 0)

      slide.style.right = `${-1 * index * this.slideWidth}px`
      this.move(index, moveTo, 0)
    }
  }

  blueimpGallery.prototype.ontouchstart = function() {}
  blueimpGallery.prototype.ontouchmove = function() {}
  blueimpGallery.prototype.ontouchend = function()  {}
  blueimpGallery.prototype.ontouchcancel = function() {}
}

export { blueimpGallery }
