require_relative ("../db/sql_runner")

class Exhibit

  attr_reader( :id, :title, :image )


  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @image = options["image"]
  end

  def save()
      sql = "INSERT INTO exhibits
      (title, image)
      VALUES
      ($1, $2)
      RETURNING id"
      values = [@title, @image]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
  end

  def self.all()
      sql = "SELECT * FROM exhibits"
      results = SqlRunner.run( sql )
      return results.map { |exhibit| Exhibit.new( exhibit ) }
  end


  def self.find( id )
    sql = "SELECT * FROM exhibits WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Exhibit.new( results.first )
  end

  def update()
      sql = "UPDATE exhibits
      SET
      (
        title,
        image
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@title, @image, @id]
      SqlRunner.run(sql, values)
  end

  def artists

    sql = "SELECT * FROM artists INNER JOIN artex ON artists.id = artex.artist_id INNER JOIN exhibits ON exhibits.id = artex.exhibit_id WHERE exhibits.id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |artist| Artist.new(artist) }
  end

  def delete()
    sql = "DELETE FROM exhibits
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
  

  def self.delete_all
      sql = "DELETE FROM exhibits"
      SqlRunner.run( sql )
  end

end
