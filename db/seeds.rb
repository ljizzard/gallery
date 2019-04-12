require_relative ("../models/artist.rb")
require_relative ("../models/exhibit.rb")
require_relative ("..models/category.rb")
require ("pry-byebug")


artist1 = Artist.new({
  "name" => "Alison King",
  "biography" => "Alison King:  Textile artist Alison King trained at Edinburgh College of Art, originally as a painter. She discovered a passion for textiles through many years of teaching. Alison has exhibited extensively and her work has been collected both in the UK and abroad."})

artist2 = Artist.new({
  "name" => "Nick Hanson",
  "biography" => "Nick Hudson: Nick Hanson. Nick is a multi-award winning landscape photographer with over 15 years of experience behind the lens. He was an award winning Landscape Photographer of the Year in 2015 and 2016. Nick considers Skye to be one of the best locations in the world for photography."})

artist3 = Artist.new({
  "name" => "Charles Steuart",
  "biography" => "Charles Steuart: Charles Steuart (1838–1907) was a prolific English still life and landscape painter who exhibited widely throughout the British Isles. He was active from 1854 to 1904."})

artist1.save
artist2.save
artist3.save

exhibit1 = Exhibit.new({
  "title" => "Witchlight (2015)",
  "image" => "http://20l3mn1zmx9s4a5tc319h94dzc4-wpengine.netdna-ssl.com/wp-content/uploads/2016/01/Alison-King-Witchlight-2015-100cms-x-60cms-embellihed-fabric-paper-paint-and-stitch.jpg"})


exhibit2 = Exhibit.new({
  "title" => "Beyond the River the Heather Burns (2012)",
  "image" => "
https://20l3mn1zmx9s4a5tc319h94dzc4-wpengine.netdna-ssl.com/wp-content/uploads/2016/01/Alison-King-Beyond-the-River-the-Heather-Burns-2012-100cmsx100cms-approx-feltfabricand-machine-stitch-540x521.jpg"})

exhibit3 = Exhibit.new({
  "title" => "Glamaig Reflection (2017)",
  "image" => "https://www.google.com/imgres?imgurl=http://static1.squarespace.com/static/5af176f312b13f5ce97cb86f/5af197e78a922d77836c0cb4/5af19988f950b790add45597/1528903264775/?format%3D1000w&imgrefurl=https://www.nickhanson.co.uk/isle-of-skye/glamaig-reflection&h=667&w=1000&tbnid=oYNsH4UMGyBSsM&q=nick+hanson+photography&tbnh=99&tbnw=149&usg=AI4_-kTrDxeV-Art4oXap-fANsySX7NJlg&vet=1&docid=GEtSKpB3N8vs3M&itg=1&sa=X&ved=2ahUKEwiW27jaxsrhAhUK1RoKHaWXCtAQ_h0wDHoECAsQCA#h=667&imgdii=oYNsH4UMGyBSsM:&tbnh=99&tbnw=149&vet=1&w=1000"})

exhibit4 = Exhibit.new({
  "title" => "Waterfall (1765)",
  "image" => "https://www.gla.ac.uk/media/media_240738_en.jpg"})

exhibit1.save
exhibit2.save
exhibit3.save
exhibit4.save



category1 = Category.new({
  "category" => "photography"})

category2 = Category.new({
  "category" => "textile"})

category3 = Category.new({
  "category" => "painting"})

category1.save
category2.save
category3.save

binding.pry
nil
