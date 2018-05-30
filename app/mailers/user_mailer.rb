class UserMailer < ApplicationMailer
  default from: 'info@backpackerexchange.com'

  def contact_mail(params)
    @sender = params[:sender]
    @reciver = params[:reciver]
    @message = params[:message]
    @item = params[:item]
    @date = Date.new
    @reciver.email
    mail( :to => @reciver.email,
      :from => @sender.email,
    :subject => "Hey! Someone is interested in your #{@item.title} ",:template_name => 'contact_mail' )
  end

end
