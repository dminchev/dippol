# require vendor/jquery.reveal.js
scrollToElement = (element, speed = 1000) ->
  $("html, body").animate
    scrollTop: element.offset().top - 80
  , speed

fixHeight = (holder, element) ->
  $(holder).each (i, item) ->
    if $(item).is(":visible")
      $(item).imagesLoaded ->
        maxHeight = 0
        $(item).find(element).each((i, k) ->
          maxHeight = 0 if (i+1 % 2) == 0
          maxHeight = ((if $(this).height() > maxHeight then $(this).height() else maxHeight))
        ).height maxHeight


$(document).ready ->
  doc = $(document)

  locationHash = location.hash
  unless locationHash is ''
    scrollToElement $(locationHash) if $(locationHash).length > 0

  #   setTimeout (->
  #       $(locationHash).click()
  #   ), 100

  # doc.on 'click', '.read-more', ->
  #   location.hash = $(this).attr 'id'

  doc.on 'click', '#header nav a', ->
    event.preventDefault()
    scrollToElement $('#' + $(this).data('anchor'))
    # location.hash = '#' + $(this).data('anchor')

  fixHeight $("#services ul.features"), $("#services ul.features > li")
  fixHeight $("#how-it-works ul"), $("#how-it-works ul h2")

  $(".product-view ul.features > li:nth-child(2n-1)").each(->
    li1 = $(this)
    li2 = $(this).next()
    height = (if li1.height() > li2.height() then li1.height() else li2.height())
    li1.height height
    li2.height height
  )

  map = L.mapbox.map("map", "somuchbetter.map-wchiw0sh").setView([42.135834,24.789566], 14)
  map.scrollWheelZoom.disable()