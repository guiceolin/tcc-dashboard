class MessagesController < ActionController::Base

  layout 'application'
  def index
    @deliveries = current_user.deliveries.unread.paginate(:page => params[:deliveries_page], :per_page => Delivery::PER_PAGE)
    @sent_messages = current_user.sent_messages.paginate(:page => params[:sent_page], :per_page => Delivery::PER_PAGE)
    flash[:notice] = 'teste de mensagem de erro'
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new params[:message]
    @message.master_project = current_user.current_master_project
    @message.sender = current_user
    @message.save

    flash[:notice] = 'Mensagem enviada com sucesso!'

    redirect_to messages_path
  end

  def show
    @delivery = current_user.deliveries.find_by_message_id(params[:id])
    @delivery.read!
    @delivery.save
    render :show
  end

  def destroy
  end

  def unread
    @delivery = current_user.deliveries.find_by_message_id(params[:id])
    @delivery.unread!
    @delivery.save
    flash[:notice] = 'Mensagem marcada como Nao lida'
    redirect_to messages_path
  end

  def read
    @delivery = current_user.deliveries.find_by_message_id(params[:id])
    @delivery.read!
    @delivery.save
    flash[:notice] = 'Mensagem marcada como lida'
    redirect_to messages_path
  end

  def archive
    @delivery = current_user.deliveries.find_by_message_id(params[:id])
    @delivery.archive
    @delivery.save
    flash[:notice] = 'Mensagem arquivada com sucesso.'
    redirect_to messages_path
  end

  def unarchive
    @delivery = current_user.deliveries.find_by_message_id(params[:id])
    @delivery.unarchive
    @delivery.save
    flash[:notice] = 'Mensagem desarquivada com sucesso.'
    redirect_to messages_path
  end

  def search
    begin
      @deliveries = current_user.deliveries.search(params).paginate(:page => params[:deliveries_page], :per_page => params[:per_page] || Delivery::PER_PAGE)
    rescue
      @deliveries = current_user.deliveries.unread.paginate(:page => params[:deliveries_page], :per_page => params[:per_page] || Delivery::PER_PAGE)
    end
  end

end
