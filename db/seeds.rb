
Food.find_or_create_by(food_type: "vegetables")
Food.find_or_create_by(food_type: "roasted vegetables")
Food.find_or_create_by(food_type: "soft cheese")
Food.find_or_create_by(food_type: "hard cheese")
Food.find_or_create_by(food_type: "starches")
Food.find_or_create_by(food_type: "fish")
Food.find_or_create_by(food_type: "rich fish")
Food.find_or_create_by(food_type: "white meat")
Food.find_or_create_by(food_type: "red meat")
Food.find_or_create_by(food_type: "cured meat")
Food.find_or_create_by(food_type: "sweets")

#food_wine_join table
def sauvignon_blanc_ids
  array_sauvignon_blanc = Wine.where varietal: "Sauvignon Blanc"
    sauvignon_blanc_ids = array_sauvignon_blanc.map do |wine|
      wine.id
  end
  sauvignon_blanc_ids
end

def find_wine_ids_by_varietal(wine_type)
    array_wines = Wine.where varietal: wine_type
    wine_ids = wine_group.map do |wine|
      wine.id
    end
  wine_ids
end

def find_food_id_by_type(food)
  food_return = Food.find_by food_type: food
  food_return.id
end

def create_food_wine_row(food, wine_type)
  foodid = find_food_id_by_type(food)
  #will return one id
  wine_ids = find_wine_ids_by_varietal(wine_type)
  #will return an array ids
  if wine_ids.length != 0
    wine_ids.each do |wineid|
      FoodWines.find_or_create_by(food_id: foodid, wine_id: wineid)
    #for each insance of wine_type make a FoodWine.create_or_find_by(food_id: , wine_id:  )
    end
  end
end

sweet_white = ["Gewürztraminer", "Müller-Thurgau", "Malvasia", "Moscato", "Riesling"]
rich_wine = []

create_food_wine_row("vegetables", "Sauvignon Blanc")
create_food_wine_row("vegetables", "Grüner Veltliner")
create_food_wine_row("vegetables", "Pinot Grigio")
create_food_wine_row("vegetables", "Albariño")
create_food_wine_row("vegetables", "Champagne")
create_food_wine_row("vegetables", "Prosecco")
create_food_wine_row("vegetables", "Cava")

create_food_wine_row("roasted vegetables", "Sauvignon Blanc")
create_food_wine_row("roasted vegetables", "Grüner Veltliner")
create_food_wine_row("roasted vegetables", "Pinot Grigio")
create_food_wine_row("roasted vegetables", "Albariño")
create_food_wine_row("roasted vegetables", "St. Laurent")
create_food_wine_row("roasted vegetables", "Pinot Noir")
create_food_wine_row("roasted vegetables", "Zweigelt")
create_food_wine_row("roasted vegetables", "Gamay")
create_food_wine_row("roasted vegetables", "Tempranillo")
create_food_wine_row("roasted vegetables", "Sangiovese")
create_food_wine_row("roasted vegetables", "Zinfandel")
create_food_wine_row("roasted vegetables", "Grenache")
create_food_wine_row("roasted vegetables", "Merlot")

create_food_wine_row("soft cheese", "Gewürztraminer")
create_food_wine_row("soft cheese", "Müller-Thurgau")
create_food_wine_row("soft cheese", "Riesling")
create_food_wine_row("soft cheese", "Moscato")
create_food_wine_row("soft cheese", "Malvasia")
create_food_wine_row("soft cheese", "Chardonnay")
create_food_wine_row("soft cheese", "Roussane")
create_food_wine_row("soft cheese", "Marsanne")
create_food_wine_row("soft cheese", "Viognier")
create_food_wine_row("soft cheese", "Champagne")
create_food_wine_row("soft cheese", "Prosecco")
create_food_wine_row("soft cheese", "Cava")
create_food_wine_row("soft cheese", "Late Harvest")
create_food_wine_row("soft cheese", "Ice Wine")
create_food_wine_row("soft cheese", "Sherry")
create_food_wine_row("soft cheese", "Port")

create_food_wine_row("hard cheese", "Gewürztraminer")
create_food_wine_row("hard cheese", "Müller-Thurgau")
create_food_wine_row("hard cheese", "Riesling")
create_food_wine_row("hard cheese", "Moscato")
create_food_wine_row("hard cheese", "Malvasia")
create_food_wine_row("hard cheese", "Champagne")
create_food_wine_row("hard cheese", "Prosecco")
create_food_wine_row("hard cheese", "Cava")
create_food_wine_row("hard cheese", "Tempranillo")
create_food_wine_row("hard cheese", "Sangiovese")
create_food_wine_row("hard cheese", "Zinfandel")
create_food_wine_row("hard cheese", "Grenache")
create_food_wine_row("hard cheese", "Merlot")
create_food_wine_row("hard cheese", "Cabernet Sauvignon")
create_food_wine_row("hard cheese", "Monatstrell")
create_food_wine_row("hard cheese", "Aglianico")
create_food_wine_row("hard cheese", "Malbec")
create_food_wine_row("hard cheese", "Syrah")

create_food_wine_row("starches", "Sauvignon Blanc")
create_food_wine_row("starches", "Grüner Veltliner")
create_food_wine_row("starches", "Pinot Grigio")
create_food_wine_row("starches", "Albariño")
create_food_wine_row("starches", "Chardonnay")
create_food_wine_row("starches", "Roussane")
create_food_wine_row("starches", "Marsanne")
create_food_wine_row("starches", "Viognier")
create_food_wine_row("starches", "Champagne")
create_food_wine_row("starches", "Prosecco")
create_food_wine_row("starches", "Cava")
create_food_wine_row("starches", "St. Laurent")
create_food_wine_row("starches", "Pinot Noir")
create_food_wine_row("starches", "Zweigelt")
create_food_wine_row("starches", "Gamay")
create_food_wine_row("starches", "Tempranillo")
create_food_wine_row("starches", "Sangiovese")
create_food_wine_row("starches", "Zinfandel")
create_food_wine_row("starches", "Grenache")
create_food_wine_row("starches", "Merlot")
create_food_wine_row("starches", "Cabernet Sauvignon")
create_food_wine_row("starches", "Monatstrell")
create_food_wine_row("starches", "Aglianico")
create_food_wine_row("starches", "Malbec")
create_food_wine_row("starches", "Syrah")
create_food_wine_row("starches", "Late Harvest")
create_food_wine_row("starches", "Ice Wine")
create_food_wine_row("starches", "Sherry")
create_food_wine_row("starches", "Port")

create_food_wine_row("fish", "Sauvignon Blanc")
create_food_wine_row("fish", "Grüner Veltliner")
create_food_wine_row("fish", "Pinot Grigio")
create_food_wine_row("fish", "Albariño")
create_food_wine_row("fish", "Chardonnay")
create_food_wine_row("fish", "Roussane")
create_food_wine_row("fish", "Marsanne")
create_food_wine_row("fish", "Viognier")
create_food_wine_row("fish", "Champagne")
create_food_wine_row("fish", "Prosecco")
create_food_wine_row("fish", "Cava")

create_food_wine_row("rich fish", "St. Laurent")
create_food_wine_row("rich fish", "Pinot Noir")
create_food_wine_row("rich fish", "Zweigelt")
create_food_wine_row("rich fish", "Gamay")
create_food_wine_row("rich fish", "Chardonnay")
create_food_wine_row("rich fish", "Roussane")
create_food_wine_row("rich fish", "Marsanne")
create_food_wine_row("rich fish", "Viognier")

create_food_wine_row("white meat", "Chardonnay")
create_food_wine_row("white meat", "Roussane")
create_food_wine_row("white meat", "Marsanne")
create_food_wine_row("white meat", "Viognier")
create_food_wine_row("white meat", "St. Laurent")
create_food_wine_row("white meat", "Pinot Noir")
create_food_wine_row("white meat", "Zweigelt")
create_food_wine_row("white meat", "Gamay")
create_food_wine_row("white meat", "Tempranillo")
create_food_wine_row("white meat", "Sangiovese")
create_food_wine_row("white meat", "Zinfandel")
create_food_wine_row("white meat", "Grenache")
create_food_wine_row("white meat", "Merlot")

create_food_wine_row("red meat", "Tempranillo")
create_food_wine_row("red meat", "Sangiovese")
create_food_wine_row("red meat", "Zinfandel")
create_food_wine_row("red meat", "Grenache")
create_food_wine_row("red meat", "Merlot")
create_food_wine_row("red meat", "Cabernet Sauvignon")
create_food_wine_row("red meat", "Monatstrell")
create_food_wine_row("red meat", "Aglianico")
create_food_wine_row("red meat", "Malbec")
create_food_wine_row("red meat", "Syrah")

create_food_wine_row("cured meats", "Gewürztraminer")
create_food_wine_row("cured meats", "Müller-Thurgau")
create_food_wine_row("cured meats", "Riesling")
create_food_wine_row("cured meats", "Moscato")
create_food_wine_row("cured meats", "Malvasia")
create_food_wine_row("cured meats", "St. Laurent")
create_food_wine_row("cured meats", "Pinot Noir")
create_food_wine_row("cured meats", "Zweigelt")
create_food_wine_row("cured meats", "Gamay")
create_food_wine_row("cured meat", "Tempranillo")
create_food_wine_row("cured meat", "Sangiovese")
create_food_wine_row("cured meat", "Zinfandel")
create_food_wine_row("cured meat", "Grenache")
create_food_wine_row("cured meat", "Merlot")
create_food_wine_row("cured meat", "Cabernet Sauvignon")
create_food_wine_row("cured meat", "Monatstrell")
create_food_wine_row("cured meat", "Aglianico")
create_food_wine_row("cured meat", "Malbec")
create_food_wine_row("cured meat", "Syrah")
create_food_wine_row("cured meat", "Late Harvest")
create_food_wine_row("cured meat", "Ice Wine")
create_food_wine_row("cured meat", "Sherry")
create_food_wine_row("cured meat", "Port")

create_food_wine_row("sweets", "Late Harvest")
create_food_wine_row("sweets", "Ice Wine")
create_food_wine_row("sweets", "Sherry")
create_food_wine_row("sweets", "Port")
create_food_wine_row("sweets", "Gewürztraminer")
create_food_wine_row("sweets", "Müller-Thurgau")
create_food_wine_row("sweets", "Riesling")
create_food_wine_row("sweets", "Moscato")
create_food_wine_row("sweets", "Malvasia")
