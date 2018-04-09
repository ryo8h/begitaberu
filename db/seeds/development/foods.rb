
names = ["りんご", "キャベツ", "にんじん", "みかん"]
adj = ["おいしい", "新鮮採れたての", "ワケあり"]
loc = ["埼玉県", "長野県", "京都府"]
make =["石田","山本","田中"]

0.upto(29) do |idx|
  food = Food.create(
    name: "#{adj[idx % 3]}#{names[idx % 4]}",
    price: 100 + (10 * idx),
    sale_start: 8.days.ago.advance(days: idx),
    sale_end: 2.days.ago.advance(days: idx),
    stock: 1000,
    locality: loc[idx % 3],
    detail: "#{loc[idx % 3]}で採れた#{adj[idx % 3]}#{names[idx % 4]}です!!!!!",
    producer: make[idx % 3],
    havest_date: "2017-11-11"
  )
  path = Rails.root.join("db/seeds/development", "food#{idx % 4 + 1}.jpg")
  file = Rack::Test::UploadedFile.new(path, "image/jpeg", true)
  FoodImage.create(
    food: food,
    uploaded_image: file
  )
end
