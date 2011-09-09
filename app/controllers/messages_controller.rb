class MessagesController < ActionController::Base

  layout 'application'
  def index
    @deliveries = current_user.deliveries
    @sent_messages = current_user.sent_messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new params[:message]
    @message.sender = current_user
    @message.save

    flash[:notice] = 'Mensagem enviada com sucesso!'

    redirect_to messages_path
  end

  def show
    @message = Message.find(params[:id])
    if (delivery = current_user.deliveries.find_by_message_id(@message.id))
      delivery.read = true
      delivery.save
    end
  end

  def destroy
  end

  def unread
    @delivery = Delivery.find_by_message_id(params[:id])
    @delivery.unread!
    @delivery.save

    flash[:notice] = 'Mensagem marcada como Nao lida'

    redirect_to messages_path
  end

  def read
    @delivery = Delivery.find_by_message_id(params[:id])
    @delivery.read!
    @delivery.save

    flash[:notice] = 'Mensagem marcada como lida'

    redirect_to messages_path
  end

end
