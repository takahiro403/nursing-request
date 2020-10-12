category_ary = ["重要","医療","業務連絡","気付き"]

category_ary.each do |category|
  Category.create(name: category)
end