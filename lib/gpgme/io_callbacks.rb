module GPGME
  class IOCallbacks
    def initialize(io)
      @io = io
    end

    def read(hook, length)
      @io.read(length)
    end

    def write(hook, buffer, length)
      data = buffer.force_encoding("UTF-8")
      @io.write(data[0 .. length])
    end

    def seek(hook, offset, whence)
      return @io.pos if offset == 0 && whence == IO::SEEK_CUR
      @io.seek(offset, whence)
      @io.pos
    end
  end
end
