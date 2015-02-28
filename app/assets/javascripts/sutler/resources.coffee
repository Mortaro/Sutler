$ ->

  autosize $('textarea')

  $('.field_with_errors input').change ->
    $(@).closest('.form-group').find('.field_with_errors').removeClass('field_with_errors')

  $('.progress-upload').each ->
    that = $(@)
    that.find('[type=file]').fileupload
      dataType: 'json',
      progressall: (e, data) ->
        that.find('.btn').fadeOut 'slow'
        progress = parseInt(data.loaded / data.total * 100, 10)
        that.find('.progress-bar').css 'width', progress + '%'
      done: (e, data) ->
        that.find('.btn').fadeIn 'slow', ->
          that.find('.progress-bar').css 'width', '0%'
        $.each data.result.files, (index, file) ->
          wrapper = $('<div class="thumbnail-wrapper">')
          image = $('<img/>').attr('src', file.url).addClass('img-thumbnail').hide()
          wrapper.append image
          that.closest('.form-group').find('.thumbnails-gallery').append wrapper
          image.slideDown()
          console.log file
        value = []
        that.closest('.form-group').find('img').each ->
          value.push $(@).attr('src')
        that.find('input[type=hidden]').val value.join(',')
