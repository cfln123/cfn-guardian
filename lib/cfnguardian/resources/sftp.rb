module CfnGuardian::Resource
  class SFTP < Base
    
    def default_alarms    
      alarm = CfnGuardian::Models::SFTPAlarm.new(@resource)
      alarm.name = 'Available'
      alarm.metric_name = 'Available'
      @alarms.push(alarm)
      
      alarm = CfnGuardian::Models::SFTPAlarm.new(@resource)
      alarm.name = 'ConnectionTime'
      alarm.metric_name = 'ConnectionTime'
      alarm.comparison_operator = 'GreaterThanThreshold'
      alarm.statistic = 'Minimum'
      alarm.threshold = 1000
      @alarms.push(alarm)
      
      if @resource.has_key?('File')
        alarm = CfnGuardian::Models::SFTPAlarm.new(@resource)
        alarm.name = 'FileExists'
        alarm.metric_name = 'FileExists'
        @alarms.push(alarm)
      
        alarm = CfnGuardian::Models::SFTPAlarm.new(@resource)
        alarm.name = 'FileGetTime'
        alarm.metric_name = 'FileGetTime'
        alarm.comparison_operator = 'GreaterThanThreshold'
        alarm.statistic = 'Minimum'
        alarm.threshold = 1000
        @alarms.push(alarm)
        
        if @resource.has_key?('FileRegexMatch')
          alarm = CfnGuardian::Models::SFTPAlarm.new(@resource)
          alarm.name = 'FileBodyMatch'
          alarm.metric_name = 'FileBodyMatch'
          @alarms.push(alarm)
        end
      end
    end
    
    def default_events
      @events.push(CfnGuardian::Models::SFTPEvent.new(@resource))
    end
    
    def default_checks
      @checks.push(CfnGuardian::Models::SFTPCheck.new(@resource))
    end
    
  end
end