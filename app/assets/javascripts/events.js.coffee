$ ->
  $(document).on 'change', '#lectures_select', (evt) ->
    $.ajax 'update_topics',
      type: 'GET'
      dataType: 'script'
      data: {
        lecture_id: $("#lectures_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic Topic select OK!")
