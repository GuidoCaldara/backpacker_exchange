class MessagesController < ApplicationController
  before_action :authenticate_user!

  def send_message
    mail = UserMailer.new
    @item = Item.find(params["message"]["item"])
    @reciver = User.find(@item.user_id)
    @message = params["message"]["message"]
    @sender = current_user
    par = {
      message: @message,
      sender: @sender,
      reciver: @reciver,
      item: @item
     }
    @favourite = Favourite.new(user_id: @sender.id, item_id: @item.id)
    @favourite.save
    mail.contact_mail(par).deliver
    current_user.message_count += 1
    current_user.save
    redirect_to item_path(@item.id)
    flash[:success] = "Great! Your message has been sent :)"
  end

end
