class DevelopmentMailInterceptor  
  def self.delivering_email(message)  
    message.subject = "[#{message.to}] #{message.subject}" 
    puts message.subject
    message.to = "jksilliman@gmail.com"  
    puts message.to 
  end  
end  
