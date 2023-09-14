enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class Filters {
  Filters({
    this.onlyGlutenFree = false,
    this.onlyLactoseFree = false,
    this.onlyVegan = false,
    this.onlyVegetarian = false,
  });

  bool onlyGlutenFree;
  bool onlyLactoseFree;
  bool onlyVegan;
  bool onlyVegetarian;

  Filters.fromFilters(Filters filters)
      : onlyGlutenFree = filters.onlyGlutenFree,
        onlyLactoseFree = filters.onlyLactoseFree,
        onlyVegan = filters.onlyVegan,
        onlyVegetarian = filters.onlyVegetarian;
}
