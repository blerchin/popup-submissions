# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	saveButton = ( ($button) ->
		@disable = ->
			$button().addClass('disabled')
		@enable = ->
			$button().removeClass('disabled')
		@
		)(-> $('a#save-images'))

	console.log "running js"
	console.log $('.dropzone')
	saveButton.disable()

	Dropzone.options.submissionsUploader =
		maxFilesize: 10
		maxFiles: 10
		addRemoveLinks: true
		init: ->
			@on "addedfile", ->
				saveButton.disable()
			@on "complete", ->
				saveButton.enable()

		removedfile: (f)->
			console.log "removed file", f
			f.serverData = if f.xhr then $.parseJSON(f.xhr.responseText) else false
			hideFile = (f) =>
				f.previewElement?.parentNode.removeChild f.previewElement
				@_updateMaxFilesReachedClass()
			if f.serverData
				$.ajax
					type: 'DELETE'
					url: Routes.submission_path(f.serverData.id)
					complete: => hideFile(f)
			else
				hideFile(f)

