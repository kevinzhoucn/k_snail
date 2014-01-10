class FrontController < ApplicationController
  def index
#  	@chat_messages = ChatMessage.find
  	@chat_messages = MessageRecord.all
#  	@chat_messages = MessageRecord.recent
  end
end
