class Modal

  constructor: (config) ->
    @$el = $('#modal')
    @$el.empty()

    @$el.addClass(config.className) if config.className
    @$el.append(JST[config.template])
    @centerModal()

    $('#modal-overlay').show()
    @$el.show()

  centerModal: ->
    viewportWidth = $('body').width()
    viewportHeight = $(window).height()
    left = (viewportWidth - @$el.width()) / 2;
    top = (viewportHeight - @$el.outerHeight()) / 2;

    @$el.css('left', left)
    @$el.css('top', top)

angular.module('UI', []).factory('$modal', ->
  ModalFactory = (config) ->
    hide = ->
      $('#modal').hide()
      $('#modal-overlay').hide()

    $('#modal-overlay').click(->
      hide()
    )

    new Modal(config)

  ModalFactory
)
