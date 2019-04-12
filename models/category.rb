require_relative( '../db/sql_runner' )

class Category

  attr_reader( :artist_id, :exhibit_id, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
    @exhibit_id = options['exhibit_id'].to_i
  end

  def save()
  sql = "INSERT INTO category
  (artist_id, exhibit_id)
  VALUES
  ($1, $2)
  RETURNING id"
  values = [@artist_id, @exhibit_id]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
  end

  def self.all()
      sql = "SELECT * FROM categories"
      results = SqlRunner.run( sql )
      return results.map { |category| Category.new( category ) }
  end

  def self.delete_all()
    sql = "DELETE FROM categories"
    SqlRunner.run( sql )
  end
end
