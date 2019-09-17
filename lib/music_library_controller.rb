class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    answer = ""
    while answer != "exit"
      answer = gets.stripe
    end
  end
end
