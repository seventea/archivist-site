# Wrapper for event.preventDefault vs event.returnValue = false
window.preventDefault = (event) ->
  event.returnValue = false
  event.preventDefault()  if event.preventDefault

