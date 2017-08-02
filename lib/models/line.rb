class Line < ActiveRecord::Base
  belongs_to :appearance
  belongs_to :location
  # belongs_to :episode, through: :episodes_characters_location
  # belongs_to :character, through: :episodes_characters_location
  # belongs_to :location, through: :episodes_characters_location

  extend Importable::ClassMethods, Formatable::ClassMethods

  def self.import(file)
    File.foreach(file) do |line|
      line.encode!("UTF-8", :invalid => :replace, :undef => :replace, :replace => "?")

      begin
        csv = CSV.parse(line, col_sep: "\t").first
        row = self.parse(csv)
        object = self.new(row)
        object.save
      rescue StandardError => e
        puts "Error when parsing #{line.inspect}"
      end
    end
  end

  def self.parse(line)
    {
      :id => line[0],
      :number => line[2],
      :timestamp_in_ms => line[4],
      :character_id => line[6],
      :episode_id => line[1],
      :location_id => line[7],
      :character_line => line[10],
      :character_normalized_line => line[11],
      :word_count => line[12]
    }
  end

  #---------QUERIES--------

  def self.find_by_segment(segment)
    segment = "%#{segment}%"
    lines = Line.where("character_normalized_line LIKE ?", segment)
            .limit(50).pluck(:id, :character_line, :appearance_id)
    keys = [:id, :character_line, :appearance_id]
    self.objectify(keys, lines)
  end

end
