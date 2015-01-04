# Wrappers for addEventListener vs attachEvent
# Shamelessly stolen from http://ejohn.org/projects/flexible-javascript-events/
window.addEvent = (obj, type, fn) ->
  if obj.attachEvent
    obj["e" + type + fn] = fn
    obj[type + fn] = ->
      obj["e" + type + fn] window.event
    obj.attachEvent "on" + type, obj[type + fn]
  else
    obj.addEventListener type, fn, false

window.removeEvent = (obj, type, fn) ->
  if obj.detachEvent
    obj.detachEvent "on" + type, obj[type + fn]
    obj[type + fn] = null
  else
    obj.removeEventListener type, fn, false

