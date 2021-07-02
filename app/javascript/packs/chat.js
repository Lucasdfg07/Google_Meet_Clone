let submit_messages;

$(document).on('turbolinks:load', function () {
    submit_messages()
    $('#messages').scrollTop($('#messages')[0].scrollHeight)
})

submit_messages = function () {
    $('#message_content').on('keydown', function (event) {
        if (event.keyCode == 13) {
            $('input').click()
            event.target.value = ''
            event.preventDefault()
        }
    })
}