$ ->

  $(document).on 'click', '.thumbnail-wrapper a', ->
    group = $(@).closest('.form-group')
    $(@).closest('.thumbnail-wrapper').remove()
    value = []
    group.find('img').each ->
      value.push $(@).attr('src')
    group.find('input[type=hidden]').val value.join(',')

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
          trash = "<a data-confirm='Are you sure?' data-remote='true' rel='nofollow' data-method='delete' href='#{file.url}'><span class='glyphicon glyphicon-trash'></span></a>"
          wrapper.append image
          wrapper.append trash
          that.closest('.form-group').find('.thumbnails-gallery').append wrapper
          image.slideDown()
        value = []
        that.closest('.form-group').find('img').each ->
          value.push $(@).attr('src')
        that.find('input[type=hidden]').val value.join(',')
