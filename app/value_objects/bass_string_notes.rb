class BassStringNotes
  attr_reader :string, :notes

  StandardTunning = [:e, :a, :g, :d]

  FilePaths = {
    e: 'db/data/e_string.json',
    a: 'db/data/a_string.json',
    g: 'db/data/g_string.json',
    d: 'db/data/d_string.json'
  }

  def initialize(string)
    @string = string
    @notes = data
  end

  def fret(number)
    @notes.find {|note| note[:fret] == number }
  end

  def note(notation)
    @notes.find {|note| note[:key] == notation }
  end

  def notes_as_cards(deck)
    @notes.map do |note|
      {
        name: note[:key],
        key: note[:key],
        fret: note[:fret],
        string: note[:string],
        due_date: Date.current,
        deck_id: deck.id
      }
    end
  end

  private

  def data
    file = File.read(FilePaths[@string])

    JSON.parse(file, symbolize_names: true)
  end
end
