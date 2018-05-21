class MessagesController < ApplicationController

  def send_message
    mail = UserMailer.new
    @item = Item.find(params["message"]["item"])
    @reciver = User.find(@item.user_id)
    @sender = current_user
    par = {
      message: params["message"]["text"],
      sender: @sender,
      reciver: @reciver,
      item: @item
     }
     byebug
    @favourite = Favourite.new(user_id: @sender.id, item_id: @item.id)
    @favourite.save
    mail.contact_mail(par).deliver
    redirect_to item_path(@item.id)
    flash[:success] = "Great! Your message has been sent :)"
  end

end
