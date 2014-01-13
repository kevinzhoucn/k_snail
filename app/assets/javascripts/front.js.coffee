# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


client = new Faye.Client('/faye')

client.subscribe '/report', (payload)->  
  dateString = moment(payload.created_at).format('D/M/YYYY H:mm:ss')
  messageString = payload.message
  tsg = payload.tsgname
  addElementMessage(dateString, messageString, tsg)  

  #time = moment(payload.created_at).format('D/M/YYYY H:mm:ss')
  # You probably want to think seriously about XSS here:
  #$('#chat').append("<li class='item'>#{time} : #{payload.message}</li>")  

addElementMessage = (dateString, messageString, tsgName) ->
  $('#chat').append("<li class='item'>#{tsgName} : #{dateString} : #{messageString}</li>")

addElementTest = ->
  $('#chat').append("<li>Test</li>")

$(document).ready ->
  input = $('input')
  tsg = $('select')
  button = $('button')
  button.click ->
    button.attr('disabled', 'disabled')
    button.text('Posting...')
    publication = client.publish '/report',
    	message: input.attr('value')
#      tsgname: tsg.attr('value')
#      tsgname: 'Albert'
    	created_at: new Date()
    publication.callback ->
    	input.attr('value', '')
    	button.removeAttr('disabled')
    	button.text('Post')
    publication.errback ->
    	button.removeAttr('disabled')
    	button.text('Try again')

# in case anyone wants to play with the inspector.
window.client = client