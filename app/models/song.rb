class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # def song_note=(note)
  #   note = Note.find_or_create_by(content: note.content)
  #   self.notes << note
  # end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_notes_ids=(notes)
    notes.each do |note|
      if !note.empty?
        note = Note.create(content: note)
        self.notes << note
      end
    end
  end

  def note_contents=(notes)
    notes.each do |note|
      if !note.empty?
        note = Note.create(content: note)
        self.notes << note
      end
    end
  end

  def note_contents
    notes = []
    self.notes.each do |note|
      notes << note.content
    end
    notes
  end
end
