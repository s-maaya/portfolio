App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function () {
    console.log('connected')
    // Called when the subscription is ready for use on the server
  },

  disconnected: function () {
    // Called when the subscription has been terminated by the server
  },

  received: function (message) {
    const messages = document.getElementById('messages')
    messages.innerHTML += message
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function (content, user_id, room_id) {
    // channels/application_cable/room_channel.rbのメソッドが呼ばれる。
    return this.perform('speak', {
      "content": content,
      "user_id": user_id,
      "room_id": room_id
    });
  }
});
// messageを送信するとここが呼ばれる。
document.addEventListener('DOMContentLoaded', function () {
  const content = document.getElementById('chat-content')
  const user_id = document.getElementById('chat-user-id')
  const room_id = document.getElementById('chat-room-id')
  const button = document.getElementById('button')

  button.addEventListener('click', function () {
    // ここで上のspeak: がよばれる。
    App.room.speak(content.value, user_id.value, room_id.value)
    content.value = ''
  })
})