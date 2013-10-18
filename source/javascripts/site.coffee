# require vendor/jquery.reveal.js

$(document).ready ->
  doc = $(document)
  
  # locationHash = location.hash
  # unless locationHash is '' and $(locationHash).length > 0
  #   setTimeout (->
  #       $(locationHash).click()
  #   ), 100

  # doc.on 'click', '.read-more', ->
  #   location.hash = $(this).attr 'id'


  fixHeight = (holder, element) ->
    $(holder).each (i, item) ->
      if $(item).is(":visible")
        $(item).imagesLoaded ->
          maxHeight = 0
          $(item).find(element).each(->
            maxHeight = (if $(this).height() > maxHeight then $(this).height() else maxHeight)
          ).height maxHeight

  fixHeight "ul.features", "li"