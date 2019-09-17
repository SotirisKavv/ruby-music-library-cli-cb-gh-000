module Concerns
  module Findable
    def self.find_by_name(name)
      self.all.detect {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
      song = self.find_by_name(name)
      if song == nil
        song = self.create(name)
      end
      song
    end
  end
end