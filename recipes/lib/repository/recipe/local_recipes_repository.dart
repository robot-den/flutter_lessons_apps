import 'package:recipes/models/models.dart';
import 'package:recipes/repository/recipe/abstract_recipes_repository.dart';

class LocalRecipesRepository implements AbstractRecipesRepository {
  @override
  List<Recipe> recipes() {
    return List.of(_recipes);
  }

  @override
  List<Recipe> filteredRecipes({Category? category, bool? isFavorite}) {
    List<Recipe> filtered = List.of(_recipes);

    if (category != null) {
      filtered = filtered.where((element) {
        return element.categories.contains(category.id);
      }).toList();
    }

    if (isFavorite != null) {
      filtered = filtered.where((element) {
        return element.isFavorite == isFavorite;
      }).toList();
    }

    Filters filtrs = filters();

    if (filtrs.onlyGlutenFree) {
      filtered = filtered.where((element) {
        return (isFavorite == true && element.isFavorite) ||
            element.isGlutenFree;
      }).toList();
    }

    if (filtrs.onlyLactoseFree) {
      filtered = filtered.where((element) {
        return (isFavorite == true && element.isFavorite) ||
            element.isLactoseFree;
      }).toList();
    }

    if (filtrs.onlyVegan) {
      filtered = filtered.where((element) {
        return (isFavorite == true && element.isFavorite) || element.isVegan;
      }).toList();
    }

    if (filtrs.onlyVegetarian) {
      filtered = filtered.where((element) {
        return (isFavorite == true && element.isFavorite) ||
            element.isVegetarian;
      }).toList();
    }

    return filtered;
  }

  // NOTE: just imitate some db update (actually we operate same recipe objects)
  @override
  Recipe updateRecipe(Recipe recipe) => recipe;

  @override
  Filters filters() => _filters;
}

final _filters = Filters();

final _recipes = [
  Recipe(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://www.giallozafferano.com/images/228-22832/spaghetti-with-tomato-sauce_1200x800.jpg',
    duration: 20,
    ingredients: [
      Ingredient(
        name: 'Tomatoes',
        imageUrl:
            'https://www.bordbia.ie/globalassets/bordbia2020/food-and-living/best-in-season-2020/salads/tomato.png',
        amountStr: '4 pcs.',
      ),
      Ingredient(
        name: 'Olive Oil',
        imageUrl: 'https://www.anticofrantoioligure.it/de/images/sito3.png',
        amountStr: '1 tbsp.',
      ),
      Ingredient(
        name: 'Onion',
        imageUrl:
            'https://www.toponions.com/l/en/library/download/urn:uuid:47b63dcd-dcc5-466a-bcab-c214b0f45c8b/gele-uien--thumb.png',
        amountStr: '1 pc.',
      ),
      Ingredient(
        name: 'Spaghetti',
        imageUrl:
            'https://ammiraticoffee.com/wp-content/uploads/2020/11/home_detail_fasciospaghettihome.png',
        amountStr: '250 g.',
      ),
      Ingredient(
        name: 'Spices',
        imageUrl:
            'https://landspices.com/wp-content/uploads/2016/09/amaya_recipe1-320x255.png',
        amountStr: 'as you like',
      ),
      Ingredient(
          name: 'Cheese',
          imageUrl:
              'https://cdn.shopify.com/s/files/1/0244/3513/0423/products/2300717_4fcdc746-ea0b-4f94-af17-5f185d26d6a2_600x.png?v=1627800575',
          amountStr: 'as you like'),
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Recipe(
    id: 'm2',
    categories: [
      'c2',
    ],
    title: 'Toast Hawaii',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://lueske-berlin.b-cdn.net/wp-content/uploads/2020/12/Lueske_Toast_Hawai_Deluxei.jpg',
    duration: 10,
    ingredients: [
      Ingredient(
        name: 'White Bread',
        imageUrl:
            'https://purepng.com/public/uploads/large/purepng.com-sliced-white-breadfood-bread-941524637306lfujv.png',
        amountStr: '1 Slice',
      ),
      Ingredient(
        name: 'Ham',
        imageUrl:
            'https://5.imimg.com/data5/SELLER/Default/2021/5/OF/TL/YD/1432671/american-smoked-turkey-ham-500x500.png',
        amountStr: '1 slice',
      ),
      Ingredient(
        name: 'Pineapple',
        imageUrl:
            'https://purepng.com/public/uploads/large/purepng.com-pineapple-slicespineappleripeananasfruithealth-981524761302kzrco.png',
        amountStr: '1 Slice',
      ),
      Ingredient(
        name: 'Cheese',
        imageUrl:
            'https://violifefoods.com/wp-content/uploads/2017/07/cheddar-slices-transparent.png',
        amountStr: '1-2 Slices',
      ),
      Ingredient(
        name: 'Butter',
        imageUrl:
            'https://freight.cargo.site/i/37cc760e6c63a6591e874bd90c14f5c22afc16b227817a37310aedd4b5a04507/free-png-butter-png-images-transparent-butter-png-850_559.png',
        amountStr: '1 tbsp.',
      ),
    ],
    steps: [
      'Butter one side of the white bread',
      'Layer ham, the pineapple and cheese on the white bread',
      'Bake the toast for round about 10 minutes in the oven at 200°C'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Recipe(
    id: 'm3',
    categories: [
      'c2',
      'c3',
    ],
    title: 'Classic Hamburger',
    affordability: Affordability.pricey,
    complexity: Complexity.simple,
    imageUrl:
        'https://img.freepik.com/premium-photo/closeup-classic-hamburger-with-beef-patty_219193-4693.jpg',
    duration: 45,
    ingredients: [
      Ingredient(
        name: 'Ground Beef',
        imageUrl:
            'https://albertafoodservice.ca/wp-content/uploads/2016/05/ground-beef-1.png',
        amountStr: '300 g.',
      ),
      Ingredient(
        name: 'Tomato',
        imageUrl:
            'https://www.bordbia.ie/globalassets/bordbia2020/food-and-living/best-in-season-2020/salads/tomato.png',
        amountStr: '1 Slice',
      ),
      Ingredient(
        name: 'Pickeled Cucumber',
        imageUrl:
            'https://assets.stickpng.com/thumbs/5eafed1ff7f4540004b715eb.png',
        amountStr: '2-3 Slices',
      ),
      Ingredient(
        name: 'Onion',
        imageUrl:
            'https://www.toponions.com/l/en/library/download/urn:uuid:47b63dcd-dcc5-466a-bcab-c214b0f45c8b/gele-uien--thumb.png',
        amountStr: '1 Slice',
      ),
      Ingredient(
        name: 'Ketchup',
        imageUrl:
            'https://pngpress.com/wp-content/uploads/2020/09/uploads_ketchup_ketchup_PNG15.png',
        amountStr: 'as you like',
      ),
      Ingredient(
        name: 'Burger Buns',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0376/3742/3148/products/brioche-buns_3_700x.png?v=1590100863',
        amountStr: '2 Slices',
      ),
    ],
    steps: [
      'Form 2 patties',
      'Fry the patties for c. 4 minutes on each side',
      'Quickly fry the buns for c. 1 minute on each side',
      'Bruch buns with ketchup',
      'Serve burger with tomato, cucumber and onion'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Recipe(
    id: 'm4',
    categories: [
      'c4',
    ],
    title: 'Wiener Schnitzel',
    affordability: Affordability.luxurious,
    complexity: Complexity.challenging,
    imageUrl:
        'http://eileenskitchenstories.com/wp-content/uploads/2017/07/Wiener-Schnitzel.jpg',
    duration: 60,
    ingredients: [
      Ingredient(
        name: 'Veal',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0359/8149/2361/products/MG_9112-removebg-preview_348x.png?v=1591473682',
        amountStr: '8 Cutlets',
      ),
      Ingredient(
        name: 'Eggs',
        imageUrl:
            'https://lohmann-breeders.com/media/2020/07/egg-weight-lost.png',
        amountStr: '4 pcs.',
      ),
      Ingredient(
        name: 'Bread Crumps',
        imageUrl:
            'https://turano.com/wp-content/uploads/2019/03/47857_Bread_Crumbs_25_lb_Fine_Bread_Crumbs_TD_05_EDITED_forceUpdate.png',
        amountStr: '200 g.',
      ),
      Ingredient(
        name: 'Flour',
        imageUrl:
            'https://nulifemarket.com/wp-content/uploads/2018/03/bowl_white-pearled-grain-flour.png',
        amountStr: '100 g.',
      ),
      Ingredient(
        name: 'Butter',
        imageUrl:
            'https://freight.cargo.site/i/37cc760e6c63a6591e874bd90c14f5c22afc16b227817a37310aedd4b5a04507/free-png-butter-png-images-transparent-butter-png-850_559.png',
        amountStr: '300 ml.',
      ),
      Ingredient(
        name: 'Vegetable Oil',
        imageUrl:
            'https://www.excelfood.co.uk/wp-content/uploads/2015/05/veg-oil-spoon-e1433156391598_clipped_rev_1-e1433429581869.png',
        amountStr: '100 g.',
      ),
      Ingredient(
        name: 'Salt',
        imageUrl: 'https://i.dlpng.com/static/png/6664237_preview.png',
        amountStr: '1 Pinch',
      ),
      Ingredient(
        name: 'Sliced Lemon',
        imageUrl:
            'https://www.gadcoegypt.com/wp-content/uploads/2018/05/Gadco-Lemon2.png',
        amountStr: 'as you like',
      ),
    ],
    steps: [
      'Tenderize the veal to about 2–4mm, and salt on both sides.',
      'On a flat plate, stir the eggs briefly with a fork.',
      'Lightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.',
      'Heat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.',
      'Make sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes ‘fluffy’.',
      'Remove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.',
      'Place the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Recipe(
    id: 'm5',
    categories: [
      'c2'
          'c5',
      'c10',
    ],
    title: 'Salad with Smoked Salmon',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl:
        'https://www.acouplecooks.com/wp-content/uploads/2021/07/Smoked-Salmon-Salad-010.jpg',
    duration: 15,
    ingredients: [
      Ingredient(
        name: 'Arugula',
        imageUrl:
            'https://static.wixstatic.com/media/081e09_88e0719a1aa34c4394da87edc9a408b5~mv2.png/v1/fit/w_500,h_500,q_90/file.png',
        amountStr: '100 g.',
      ),
      Ingredient(
        name: 'Lamb\'s Lettuce',
        imageUrl:
            'https://www.fondation-louisbonduelle.org/wp-content/uploads/2016/09/mache_416993071-e1475241025446.png',
        amountStr: '100 g.',
      ),
      Ingredient(
        name: 'Parsley',
        imageUrl:
            'https://cdn.pixabay.com/photo/2018/08/22/05/16/parsley-3622868_1280.png',
        amountStr: '100 g.',
      ),
      Ingredient(
        name: 'Fennel',
        imageUrl:
            'https://5.imimg.com/data5/SELLER/Default/2020/8/OW/NN/MK/84500358/fennel-seeds-variyali-500x500.png',
        amountStr: '100 g.',
      ),
      Ingredient(
        name: 'Smoked Salmon',
        imageUrl:
            'https://fourseasinter.com/wp-content/uploads/2021/01/400-by-400-products3-300x300.png',
        amountStr: '200 g.',
      ),
      Ingredient(
        name: 'Mustard',
        imageUrl:
            'https://wilstar.com/wp-content/uploads/2016/08/national-mustard-day.png',
        amountStr: '2 tbsp.',
      ),
      Ingredient(
        name: 'Balsamic Vinegar',
        imageUrl:
            'https://static.wixstatic.com/media/4fa0ed_9dce3284eafc4fce8e1b860efa4da3fb~mv2.png/v1/fill/w_1000,h_667,al_c,usm_0.66_1.00_0.01/4fa0ed_9dce3284eafc4fce8e1b860efa4da3fb~mv2.png',
        amountStr: '2 tbsp..',
      ),
      Ingredient(
        name: 'Olive Oil',
        imageUrl: 'https://www.anticofrantoioligure.it/de/images/sito3.png',
        amountStr: '2 tbsp.',
      ),
      Ingredient(
        name: 'Salt & Pepper',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0256/3594/6544/products/SaltandPepperCellar_1200x1200.png?v=1629209237',
        amountStr: '1 Pinch',
      ),
    ],
    steps: [
      'Wash and cut salad and herbs',
      'Dice the salmon',
      'Process mustard, vinegar and olive oil into a dessing',
      'Prepare the salad',
      'Add salmon cubes and dressing'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Recipe(
    id: 'm6',
    categories: [
      'c6',
      'c10',
    ],
    title: 'Delicious Orange Mousse',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl: 'https://i.ytimg.com/vi/ba_3ICebDoo/maxresdefault.jpg',
    duration: 240,
    ingredients: [
      Ingredient(
        name: 'Gelatine Sheets',
        imageUrl: 'https://www.frije.com/content/ingredients/331.png?cc=24482',
        amountStr: '4 Sheets',
      ),
      Ingredient(
        name: 'Orange Juice',
        imageUrl:
            'https://www.dole.com/-/media/project/dole/produce-images/fruit/oranges_cut_web.png?h=630&w=1200&rev=5e260d0d7c624319b64d7667c3242e04&hash=C02D624D0A7769E761931CD94BB68AED',
        amountStr: '150 ml.',
      ),
      Ingredient(
        name: 'Sugar',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0504/5600/2723/products/organic-cane-sugar-bulk_1440x1600.png?v=1628023692',
        amountStr: '80 g.',
      ),
      Ingredient(
        name: 'Yoghurt',
        imageUrl:
            'https://www.pngarts.com/files/3/Yogurt-Transparent-Image.png',
        amountStr: '300 g.',
      ),
      Ingredient(
        name: 'Cream',
        imageUrl:
            'https://s3.amazonaws.com/static.realcaliforniamilk.com/media/assets/cream_fraich_c.png',
        amountStr: '200 g.',
      ),
      Ingredient(
        name: 'Orange Peel',
        imageUrl:
            'https://www.biovoices.eu/image_temp/516X516_516X516_983d2efd57d6375b74c96647e731092f.png',
        amountStr: 'as you like',
      ),
    ],
    steps: [
      'Dissolve gelatine in pot',
      'Add orange juice and sugar',
      'Take pot off the stove',
      'Add 2 tablespoons of yoghurt',
      'Stir gelatin under remaining yoghurt',
      'Cool everything down in the refrigerator',
      'Whip the cream and lift it under die orange mass',
      'Cool down again for at least 4 hours',
      'Serve with orange peel',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Recipe(
    id: 'm7',
    categories: [
      'c7',
    ],
    title: 'Pancakes',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
        'https://images-gmi-pmc.edge-generalmills.com/df109202-f5dd-45a1-99b4-f10939afd509.jpg',
    duration: 20,
    ingredients: [
      Ingredient(
        name: 'All-Purpose Flour',
        imageUrl:
            'https://nulifemarket.com/wp-content/uploads/2018/03/bowl_white-pearled-grain-flour.png',
        amountStr: '1 1/2 Cups',
      ),
      Ingredient(
        name: 'Baking Powder',
        imageUrl:
            'https://swagatgrocery.com/wp-content/uploads/2021/01/baking-powder.png',
        amountStr: '3 1/2 tsp.',
      ),
      Ingredient(
        name: 'Salt',
        imageUrl: 'https://i.dlpng.com/static/png/6664237_preview.png',
        amountStr: '1 tsp.',
      ),
      Ingredient(
        name: 'White Sugar',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0504/5600/2723/products/organic-cane-sugar-bulk_1440x1600.png?v=1628023692',
        amountStr: '1 tbsp.',
      ),
      Ingredient(
        name: 'Milk',
        imageUrl:
            'https://drinkmilk.co.uk/wp-content/uploads/2020/05/milk_2pint.png',
        amountStr: '1 1/4 Cups',
      ),
      Ingredient(
        name: 'Egg',
        imageUrl:
            'https://lohmann-breeders.com/media/2020/07/egg-weight-lost.png',
        amountStr: '1 pc.',
      ),
      Ingredient(
        name: 'Melted Butter',
        imageUrl:
            'https://igav3-metcdn-com.global.ssl.fastly.net/content/uploads/sites/2/2016/10/26041213/melted-butter.png',
        amountStr: '3 tbsp.',
      ),
    ],
    steps: [
      'In a large bowl, sift together the flour, baking powder, salt and sugar.',
      'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      'Heat a lightly oiled griddle or frying pan over medium high heat.',
      'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Recipe(
    id: 'm8',
    categories: [
      'c8',
    ],
    title: 'Creamy Indian Chicken Curry',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl:
        'https://gimmedelicious.com/wp-content/uploads/2021/01/Chicken-Curry-SQ.jpg',
    duration: 35,
    ingredients: [
      Ingredient(
        name: 'Chicken Breast',
        imageUrl:
            'https://www.wholesalemeatsdirect.co.nz/wp-content/uploads/chicken-breasts-skinless.png',
        amountStr: '4 pcs.',
      ),
      Ingredient(
        name: 'Onion',
        imageUrl:
            'https://www.toponions.com/l/en/library/download/urn:uuid:47b63dcd-dcc5-466a-bcab-c214b0f45c8b/gele-uien--thumb.png',
        amountStr: '1 pc.',
      ),
      Ingredient(
        name: 'Garlic Cloves',
        imageUrl:
            'https://spiceworldinc.com/wp-content/uploads/2020/01/Fresh-Garlic-Product-Page-Feature.png',
        amountStr: '2 pcs.',
      ),
      Ingredient(
        name: 'Ginger Slices',
        imageUrl:
            'https://freshworld.pk/wp-content/uploads/2020/05/ginger-1.png',
        amountStr: '1 pc.',
      ),
      Ingredient(
        name: 'Almonds',
        imageUrl:
            'https://www.greekseller.com/images/products/original/roasted-almonds.png',
        amountStr: '4 tbsp.',
      ),
      Ingredient(
        name: 'Cayenne Pepper',
        imageUrl:
            'https://al-salamtrading.com/wp-content/uploads/cayenne-pepper02.png',
        amountStr: '1 tbsp.',
      ),
      Ingredient(
        name: 'Coconut Milk',
        imageUrl:
            'https://cdn.forestessentialsindia.com/blog/wp-content/uploads/2020/02/Coconut-milk.png',
        amountStr: '500 ml.',
      ),
    ],
    steps: [
      'Slice and fry the chicken breast',
      'Process onion, garlic and ginger into paste and sauté everything',
      'Add spices and stir fry',
      'Add chicken breast + 250ml of water and cook everything for 10 minutes',
      'Add coconut milk',
      'Serve with rice'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Recipe(
    id: 'm9',
    categories: [
      'c9',
    ],
    title: 'Chocolate Souffle',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl:
        'https://www.justonecookbook.com/wp-content/uploads/2021/02/Chocolate-Souffle-9632-I-2.jpg',
    duration: 45,
    ingredients: [
      Ingredient(
        name: 'Melted Butter',
        imageUrl:
            'https://igav3-metcdn-com.global.ssl.fastly.net/content/uploads/sites/2/2016/10/26041213/melted-butter.png',
        amountStr: '1 tsp.',
      ),
      Ingredient(
        name: 'White Sugar',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0504/5600/2723/products/organic-cane-sugar-bulk_1440x1600.png?v=1628023692',
        amountStr: '2 tbsp.',
      ),
      Ingredient(
        name: 'Dark Chocolate',
        imageUrl:
            'https://purepng.com/public/uploads/large/purepng.com-chocolatechocolatesweetcacaoanandamide-14115272312602xqll.png',
        amountStr: '2 oz.',
      ),
      Ingredient(
        name: 'Butter',
        imageUrl:
            'https://freight.cargo.site/i/37cc760e6c63a6591e874bd90c14f5c22afc16b227817a37310aedd4b5a04507/free-png-butter-png-images-transparent-butter-png-850_559.png',
        amountStr: '1 tbsp.',
      ),
      Ingredient(
        name: 'All-Purpose Flour',
        imageUrl:
            'https://nulifemarket.com/wp-content/uploads/2018/03/bowl_white-pearled-grain-flour.png',
        amountStr: '1 tbsp.',
      ),
      Ingredient(
        name: 'Cold Milk',
        imageUrl:
            'https://drinkmilk.co.uk/wp-content/uploads/2020/05/milk_2pint.png',
        amountStr: '4 1/3 tbsp.',
      ),
      Ingredient(
        name: 'Salt',
        imageUrl: 'https://i.dlpng.com/static/png/6664237_preview.png',
        amountStr: '1 Pinch',
      ),
      Ingredient(
        name: 'Cayenne Pepper',
        imageUrl:
            'https://al-salamtrading.com/wp-content/uploads/cayenne-pepper02.png',
        amountStr: '1 Pinch',
      ),
      Ingredient(
        name: 'Egg Yolk',
        imageUrl:
            'https://www.vippng.com/png/full/436-4362382_products-boiled-egg.png',
        amountStr: '1 pc.',
      ),
      Ingredient(
        name: 'Egg Whites',
        imageUrl:
            'https://www.pngkey.com/png/full/597-5973159_we-chose-to-use-a-bit-of-egg.png',
        amountStr: '2 pcs.',
      ),
      Ingredient(
        name: 'Tartar Cream',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0271/3537/7545/products/Cream-of-Tartar-removebg-preview.png?v=1598904513',
        amountStr: '1 Pinsh',
      ),
      Ingredient(
        name: 'White Sugar',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0504/5600/2723/products/organic-cane-sugar-bulk_1440x1600.png?v=1628023692',
        amountStr: '1 tbsp.',
      ),
    ],
    steps: [
      'Preheat oven to 190°C. Line a rimmed baking sheet with parchment paper.',
      'Brush bottom and sides of 2 ramekins lightly with 1 teaspoon melted butter; cover bottom and sides right up to the rim.',
      'Add 1 tablespoon white sugar to ramekins. Rotate ramekins until sugar coats all surfaces.',
      'Place chocolate pieces in a metal mixing bowl.',
      'Place bowl over a pan of about 3 cups hot water over low heat.',
      'Melt 1 tablespoon butter in a skillet over medium heat. Sprinkle in flour. Whisk until flour is incorporated into butter and mixture thickens.',
      'Whisk in cold milk until mixture becomes smooth and thickens. Transfer mixture to bowl with melted chocolate.',
      'Add salt and cayenne pepper. Mix together thoroughly. Add egg yolk and mix to combine.',
      'Leave bowl above the hot (not simmering) water to keep chocolate warm while you whip the egg whites.',
      'Place 2 egg whites in a mixing bowl; add cream of tartar. Whisk until mixture begins to thicken and a drizzle from the whisk stays on the surface about 1 second before disappearing into the mix.',
      'Add 1/3 of sugar and whisk in. Whisk in a bit more sugar about 15 seconds.',
      'whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
      'Transfer a little less than half of egg whites to chocolate.',
      'Mix until egg whites are thoroughly incorporated into the chocolate.',
      'Add the rest of the egg whites; gently fold into the chocolate with a spatula, lifting from the bottom and folding over.',
      'Stop mixing after the egg white disappears. Divide mixture between 2 prepared ramekins. Place ramekins on prepared baking sheet.',
      'Bake in preheated oven until scuffles are puffed and have risen above the top of the rims, 12 to 15 minutes.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Recipe(
    id: 'm10',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    title: 'Asparagus Salad with Cherry Tomatoes',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl:
        'https://juliasalbum.com/wp-content/uploads/2021/09/asparagus-tomato-salad-with-burrata-cheese-1.jpg',
    duration: 30,
    ingredients: [
      Ingredient(
        name: 'Aspargus',
        imageUrl:
            'https://ml0gvze9zd0y.i.optimole.com/_69KEH4-K2xj4sR3/w:1024/h:634/q:90/https://euromeridian.nl/wp-content/uploads/2021/01/59bf7ed37a216d0b052f12cf.png',
        amountStr: '200 g.',
      ),
      Ingredient(
        name: 'Pine Nuts',
        imageUrl:
            'https://www.southernstylespices.com/wp-content/uploads/2019/04/Nuts_Seeds-Pine_Nuts_20190125_042-e1555209265984.png',
        amountStr: '30 g.',
      ),
      Ingredient(
        name: 'Cherry Tomatoes',
        imageUrl:
            'https://mucci-production-user-uploads-bucket.s3.amazonaws.com/images/Product-IMG_ChertoTomatoes-rev2.original.png',
        amountStr: '300 g.',
      ),
      Ingredient(
        name: 'Salt & Pepper',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0256/3594/6544/products/SaltandPepperCellar_1200x1200.png?v=1629209237',
        amountStr: '1 Pinch',
      ),
      Ingredient(
        name: 'Olive Oil',
        imageUrl: 'https://www.anticofrantoioligure.it/de/images/sito3.png',
        amountStr: '2 tsp.',
      ),
    ],
    steps: [
      'Wash, peel and cut the asparagus',
      'Cook in salted water',
      'Salt and pepper the asparagus',
      'Roast the pine nuts',
      'Halve the tomatoes',
      'Mix with asparagus, salad and dressing',
      'Serve with Baguette'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];
