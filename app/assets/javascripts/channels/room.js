$(function () {
  App.room = App.cable.subscriptions.create({
    channel: "RoomChannel",
    room: $('#messages').data('room_id')
  }, {
    connected: function () {
      console.log('connected')
      // Called when the subscription is ready for use on the server
      // サーバーでサブスクリプションを使用する準備ができたときに呼び出されます
    },

    disconnected: function () {
      // Called when the subscription has been terminated by the server
    },

    received: function (data) {
      $('#messages').animate({
        scrollTop: $('#messages')[0].scrollHeight
      }, 1000);
      return $('#messages').append(data["message"]);
      // Called when there's incoming data on the websocket for this channel
      // このチャネルのWebSocketに着信データがあるときに呼び出されます
    },

    speak: function (data) {
      // channels/application_cable/room_channel.rbのメソッドが呼ばれる。
      return this.perform('speak', data);
    }
  });
  // roomのshowを表示したら呼ばれる

})
document.addEventListener('DOMContentLoaded', function () {
  const content = document.getElementById('chat-content');
  const user_id = document.getElementById('chat-user-id');
  const room_id = document.getElementById('chat-room-id');
  const button = document.getElementById('button');
  const input = document.getElementById('chat-content');
  //   // ボタンを押したら呼ばれる
  //   button.addEventListener('click', function () {
  //     // ここで上のspeak: がよばれる。
  //     console.log(content.value, user_id.value, room_id.value)
  //     App.room.speak({
  //       content: content.value,
  //       user_id: user_id.value,
  //       room_id: room_id.value
  //     });
  //     content.value = '';
  //   });
  // });


  // ボタンを押したら呼ばれる
  button.addEventListener('click', function () {
    // ここで上のspeak: がよばれる。
    console.log(content.value, user_id.value, room_id.value)
    a();
  });
  input.addEventListener("keydown", event => {
    if (event.keyCode === 13) {
      a();
    }
    // 何かをする
  });

  //Enterが押されたときと、送信ボタンが押されたときに↓のaが呼ばれる。
  function a() {
    App.room.speak({
      content: content.value,
      user_id: user_id.value,
      room_id: room_id.value
    });
    content.value = '';
  }

})