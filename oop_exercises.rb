class SecurityLogger
  @@log_requests = 0
  def create_log_entry
    @@log_requests += 1
  end

  def self.return_log
    @@log_requests
  end
end

class SecretFile < SecurityLogger
  attr_reader :data

  def initialize(secret_data)
    @data = secret_data
  end

  def data
    create_log_entry
    @data
  end
end

try = SecretFile.new(10)
keep = SecretFile.new(24)
puts try.data
puts keep.data
puts SecurityLogger.return_log

