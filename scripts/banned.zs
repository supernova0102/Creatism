var banned = [<item:ae2:condenser>];
for element in banned{
    recipes.remove(element);
    element.addTooltip("비활성화 됐습니다.");
} 


recipes.remove(<item:ae2:vibration_chamber>);

<item:ae2:vibration_chamber>.addTooltip("비활성화 됐습니다.");

//<recipetype:immersiveengineering:alloy>.addRecipe("spin_iron_to_gold", <item:minecraft:iron_ingot> * 10, <tag:items:minecraft:wool>, 200, <item:minecraft:gold_ingot> * 2);