class ApplicationService
  # Args go to .call/#call, never to a needless #initialize.
  def self.call(...)
    new.call(...)
  end
end
