recipes.remove(<item:createsifter:brass_mesh>);
recipes.remove(<item:createsifter:zinc_mesh>);
recipes.remove(<item:ae2:vibration_chamber>);

<item:createsifter:brass_mesh>.addTooltip("밴 됐습니다.");
<item:createsifter:zinc_mesh>.addTooltip("밴 됐습니다.");
<item:ae2:vibration_chamber>.addTooltip("밴 됐습니다.");

<recipetype:immersiveengineering:alloy>.addRecipe("spin_iron_to_gold", <item:minecraft:iron_ingot> * 10, <tag:items:minecraft:wool>, 200, <item:minecraft:gold_ingot> * 2);