module HomeHelper
    def relative_time(created_at)
      time_ago_in_words(created_at)
    end
  
    def formatted_time(time)
      time.to_formatted_s(:medium)
    end

    def use_time
      created_at.strftime("%m/%d/%y at %l:%M %p")
    end

    def resource_name
      :user
    end
  
    def resource
          @resource ||= User.new
    end
 
end