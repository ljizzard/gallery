require_relative( '../db/sql_runner' )

class Artex

  attr_reader( :artist_id, :exhibit_id, :id )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
    @exhibit_id = options['exhibit_id'].to_i
  end

  def save()
  sql = "INSERT INTO artex
  (artist_id,
    exhibit_id)
  VALUES
  ($1, $2)
  RETURNING id"
  values = [@artist_id, @exhibit_id]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
  end

  def self.all()
      sql = "SELECT * FROM Artex"
      results = SqlRunner.run( sql )
      return results.map { |artex| Artex.new( artex ) }
  end

  def artist()
      sql = "SELECT * FROM artists
      WHERE id = $1"
      values = [@artist_id]
      results = SqlRunner.run( sql, values )
      return Artist.new( results.first )
  end

  def exhibit()
      sql = "SELECT * FROM exhibits
      WHERE id = $1"
      values = [@exhibit_id]
      results = SqlRunner.run( sql, values )
      return Exhibit.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM artex"
    SqlRunner.run( sql )
  end
end
