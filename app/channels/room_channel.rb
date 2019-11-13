class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # action cableの最後に呼ばれるところ
  # ここでようやくMessageモデルに保存
  def speak(data)
    message =  Message.create!(content: data['content'], user_id: data["user_id"], room_id: data["room_id"])
    template = ApplicationController.renderer.render(partial: 'end_user/messages/message', locals: {message: message})
    ActionCable.server.broadcast 'room_channel', template
  end
end
