require_relative ("../db/sql_runner")

class Artist

  attr_reader( :id, :name, :biography, :exhibit_id )


  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @biography = options["biography"]
    @exhibit_id = options["exhibit"]
  end

  def save()
      sql = "INSERT INTO artists
      (
        name,
        biography
      )
      VALUES
      ($1, $2)
      RETURNING id"
      values = [@name, @biography]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def self.all()
      sql = "SELECT * FROM artists"
      results = SqlRunner.run( sql )
      return results.map { |artist| Artist.new( artist ) }
  end

  def self.delete_all
      sql = "DELETE FROM artists"
      SqlRunner.run( sql )
  end

  def self.map_items(artist_data)
      return artist_data.map { |artist| Artist.new(artist) }
  end

end
