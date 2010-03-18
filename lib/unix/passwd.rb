
module Unix
  class Passwd
    include Enumerable
    attr_reader :pwents

    def initialize
      @pwents = []
      loop do
        ptr = UnixFFI::Struct::Passwd.new(UnixFFI.getpwent())
        unless ptr[:pw_name]
          UnixFFI.endpwent
          break
        end
        @pwents << Pwent.new(ptr)
      end
    end

    def each
      @pwents.each {|pwent| yield pwent}
    end

    def [](i)
      @pwents[i]
    end
  end
end
