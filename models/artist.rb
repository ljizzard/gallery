require_relative ("../db/sql_runner")

class Artist

  attr_accessor :name, :biography, :exhibit_id, :id



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

  def Artist.find( id )
      sql = "SELECT * FROM artists
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values)
      return Artist.new(results.first)
  end

  def delete()
    sql = "DELETE FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
      sql = "DELETE FROM artists"
      SqlRunner.run( sql )
  end

  def self.map_items(artist_data)
      return artist_data.map { |artist| Artist.new(artist) }
  end

end
