# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

goldbricks_ready = ->

  $('a.goldbrick-delete-link').each ->
    link = $(@)
    link.on 'ajax:success', (event, data, status, xhr) ->
      link.closest('tr').hide()

$(document).ready(goldbricks_ready)
$(document).on('page:load', goldbricks_ready)
