class MessagesController < ApplicationController

  def send_message
    mail = UserMailer.new
    par = {
      message: params["message"]["text"],
      sender: User.find(params["message"]["sender"]),
      reciver: User.find(params["message"]["reciver"]),
      item: Item.find(params["message"]["item"])
     }
    @favourite = Favourite.new(user_id: params["message"]["sender"], item_id: params["message"]["item"])
    @favourite.save
    mail.contact_mail(par).deliver
    redirect_to item_path(params["message"]["item"].to_i)
  end

end
