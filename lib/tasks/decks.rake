
namespace :decks do
  desc "Generate a deck for each string in standard tunning. Run with: rake decks:generate_bass"
  task generate: :environment do
    puts "Starting"

    user = User.last
    string_notes = BassStringNotes::StandardTunning
    value_objects = string_notes.map { |string| BassStringNotes.new(string) }

    value_objects.each do |obj|
      deck = Deck.create(name: "#{obj.string} string", user: User.last)
      AddCardsToDeckFromNotes.new(User.last).run(deck, obj.notes)
      puts "#{obj.string} string deck created"
    end

    puts "Done"
  end

  task destroy: :environment do
    puts 'The world is ending, not with a bang...'
    Deck.destroy_all
    puts '...but with a whimper'
  end
end