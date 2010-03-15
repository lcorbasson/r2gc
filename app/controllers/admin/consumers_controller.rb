class Admin::ConsumersController < Admin::ResourceController

  def index
    @consumers = Consumer.all
  end

  def new
    @consumer = Consumer.new
  end

  def edit
    @consumer = Consumer.find(params[:id])
  end
end
