# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

MODAL_CONTENT_SELECTOR = ".modal .modal-body pre"
lastRequest = null 

scrollToBottomModal = ->
  $(".modal .modal-body").scrollTop $(MODAL_CONTENT_SELECTOR).height()

fitModalSize = ->
  modal = $(".modal")
  header = $(".modal-header", modal)
  body = $(".modal-body", modal)

  modalheight = parseInt(modal.css("height"))
  headerheight = parseInt(header.css("height")) + parseInt(header.css("padding-top")) + parseInt(header.css("padding-bottom"))
  bodypaddings = parseInt(body.css("padding-top")) + parseInt(body.css("padding-bottom"))

  height = modalheight - headerheight - bodypaddings - 120 # fudge factor

  body.css("max-height", "#{height}px")

appendToModal = (data)->
  $(MODAL_CONTENT_SELECTOR).append(data)
  
resetModal = (data)->
  lastRequest.abort() if lastRequest?
  $(MODAL_CONTENT_SELECTOR).empty()
  
onprogress = (e)->
  thisResponse = undefined
  response = e.currentTarget.response
  if lastRespLength
    thisResponse = response.substring(lastRespLength)
    lastRespLength = response.length
  else
    thisResponse = response
    lastRespLength = response.length
  appendToModal thisResponse
  scrollToBottomModal()
  return
  
$(window).resize fitModalSize
$(window).resize scrollToBottomModal
$("body").ready fitModalSize  

window.hyperDo = (action)->
  resetModal()
  lastRespLength = false
  
  lastRequest = $.ajax(
    method: "POST"
    url: "/containers/#{action}", 
    xhrFields: onprogress: onprogress.bind(this)
  ).done((data) ->
    setTimeout window.location.reload.bind(window.location), 1000
    return
  ).fail (data) ->
    return
