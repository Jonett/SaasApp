class Timestamp < ActiveRecord::Base
  belongs_to :user
  
  private
    def calculate_workTime
      self.work_time = self.time_in.to_i - self.time_out.to_i
      
      self.ot1_time = 0
      self.ot2_time = 0
      
      current_date = time_in.midnight
      
      while current_date.day <= time_out.day
        start = self.time_in
        if current_date.day > self.time_in.day
          start = current_date
        end
        stop = self.time_out
        if current_date.day < self.time_out.day
          stop = current_date + 1.days
        end
        
        ot1_time, ot2_time = get_ot_times(start, stop)
        self.ot1_time += ot1_time
        self.ot2_time += ot2_time
        
        current_date += 1.days
      end
    end
    
    def get_ot_times(time_in, time_out)
      ot2_early_end = time_in
      ot2_early_end = ot2_early_end.change(hour: 6, minute: 0, second: 0)
      
      ot1_start = time_in
      ot1_start = ot1_start.change(hour: 18, minute: 0, second: 0)
      
      ot2_start = punched_in
      ot2_start = ot2_start.change(hour: 22, minute: 0, second: 0)
      
      ot1_duration = 0
      ot2_duration = 0
      
      #early ot2
      if(ot2_early_end.to_i - punched_in.to_i) > 0
        #If we start timer before 0600 early ot2 is on!
        
        
      end
    end
end