class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # action cableの最後に呼ばれるところ
  # ここでようやくMessageモデルに保存
  def speak(data)
    Message.create!(content: data['content'], user_id: data["user_id"], room_id: data["room_id"])

    # ==========ここにかいても、ちゃんとMessageモデルに保存された後に実行してくれない(ページのリロードがおきちゃう)なので、broadcast_jobをつくって、それをMessageモデルで保存した後に呼び出し(after_create_commit)==========
    # template = ApplicationController.renderer.render(partial: 'end_user/messages/message', locals: {message: message})
    # ActionCable.server.broadcast 'room_channel_', message: message
  end
end