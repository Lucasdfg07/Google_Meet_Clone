import consumer from "./consumer"

consumer.subscriptions.create("ChatRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(content, user, created_at) {
    // Called when there's incoming data on the websocket for this channel
    $('#messages').append(
      '<div class="mt-3">' +
          '<small>'+ user +' ('+ created_at +')</small> <br />'+
          ''+ content +'' +
      '</div>'
    )

    $('#messages').scrollTop($('#messages')[0].scrollHeight)
  }
});
