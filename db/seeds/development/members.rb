names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
fnames = ["佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子"]
0.upto(9) do |idx|
  Member.create(
    user_name: names[idx],
    name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
    password: "password",
    password_confirmation: "password",
    email: "#{names[idx]}@example.com",
    gender: [0, 0, 1][idx % 3],
    age: idx + 20,
    address: "東京都",
    user_type: false
  )
end

Member.create(
  user_name: "hokkaido",
  name: "北海道センター",
  password: "hokkaido",
  password_confirmation: "hokkaido",
  email: "hokkaido@example.com",
  gender: 0,
  age: 1,
  address: "北海道",
  user_type: true
)
