require_relative ("../models/artist.rb")
require_relative ("../models/exhibit.rb")
require_relative ("../models/artex.rb")
require ("pry-byebug")

Artist.delete_all()
Artex.delete_all()
Exhibit.delete_all()


artist1 = Artist.new({
  'name' => 'Alison King',
  'biography' => 'Alison King:  Textile artist Alison King trained at Edinburgh College of Art,
   originally as a painter. She discovered a passion for textiles through many years of teaching.
    Alison has exhibited extensively and her work has been collected both in the UK and abroad.'
    })
artist1.save

artist2 = Artist.new({
  'name' => 'Nick Hanson',
  'biography' => 'Nick Hudson: Nick Hanson. Nick is a multi-award winning landscape photographer
   with over 15 years of experience behind the lens.
   He was an award winning Landscape Photographer of the Year in 2015 and 2016.
   Nick considers Skye to be one of the best locations in the world for photography.'})

artist2.save


artist3 = Artist.new({
  'name' => 'The Embroiderers Guild',
  'biography' => "The Embroiderers Guild: The Embroiderers Guild exists to build awareness of
  stitch and textile art. We educate, encourage, inspire, and promote the achievement of excellence.
   Members are encouraged to participate in any area of interest at any level, whether young people
   learning to stitch, a professional artist extending the boundaries of textile art, or someone who
    simply appreciates fabric and thread. We believe that textiles are as relevant today as they have
     ever been, and there is a place for both the traditional, fine hand stitching alongside the bold
      and contemporary machine work." })

artist3.save



exhibit1 = Exhibit.new({
  'title' => 'Witchlight (2015)',
  'image' => '/images/Alison-King-Witchlight-2015-100cms-x-60cms-embellihed-fabric-paper-paint-and-stitch.jpg'})


exhibit2 = Exhibit.new({
  'title' => 'Beyond the River the Heather Burns (2012)',
  'image' => '/images/Alison-King-Beyond-the-River-the-Heather-Burns-2012-100cmsx100cms-approx-feltfabricand-machine-stitch-540x521.jpg'})

exhibit3 = Exhibit.new({
  'title'=> 'Glamaig Reflection (2017)',
  'image' => '/images/glamaig-isle-of-skye-1.jpg'})

exhibit4 = Exhibit.new({
  'title' => 'The Hardhome Embroidery (2018)',
  'image' => '/images/whitewalkerfirst2.jpg'})

exhibit1.save
exhibit2.save
exhibit3.save
exhibit4.save

artex1 = Artex.new({
  "artist_id" => artist1.id,
  "exhibit_id" => exhibit1.id
})

artex2 = Artex.new({
  "artist_id" => artist1.id,
  "exhibit_id" => exhibit2.id
  })

artex3 = Artex.new({
  "artist_id" => artist2.id,
  "exhibit_id" => exhibit3.id
  })

artex4 = Artex.new({
  "artist_id" => artist3.id,
  "exhibit_id" => exhibit4.id
  })

artex1.save()
artex2.save()
artex3.save()
artex4.save()



#
# category1 = Category.new({
#   'category' => 'photography'})
#
# category2 = Category.new({
#   'category' => 'textile'})
#
# category3 = Category.new({
#   'category' => 'painting'})
#
# category1.save
# category2.save
# category3.save

# binding.pry
# nil
