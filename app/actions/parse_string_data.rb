class ParseStringData
  def run(file_path)
    file = File.read(file_path)

    JSON.parse(file, symbolize_names: true)
  end
end
