class RealtimeReportController < FayeRails::Controller
  channel '/report' do
    subscribe do
    	Rails.logger.debug "Received on #{channel}: #{inspect}"

    	created_at = 
        if message['created_at'] && message['created_at'].size > 0
    		  Time.parse(message['created_at'])
				else
				 	Time.now
				end

      tsgname = message['tsgname']
      Rails.logger.debug "Received message #{tsgname}"

#      tsg = Tsg.find_by_name(tsgname)
#      tsg = Tsg.first
      message_record = MessageRecord.new(title: message['message'])
#      message = Tsg.first.messag_records.new(title: message['message'])
      message = Tsg.first.messag_records.build(message_record)
      message.save

  		# message_record = MessageRecord.new(title: message['message'])
  		# message_record.save
#      ChatMessage.new(message['message'], created_at)
    end
  end
end
