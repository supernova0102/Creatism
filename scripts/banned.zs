var banned = [
    <item:ae2:vibration_chamber>,
    <item:thermal:device_rock_gen>,
    <item:thermal:dynamo_stirling>,
    <item:thermal:dynamo_numismatic>,
    <item:thermal:dynamo_magmatic>,
    <item:exnihilosequentia:emerald_mesh>,
    <item:exnihilosequentia:diamond_mesh>,
    <item:exnihilosequentia:netherite_mesh>];
for element in banned{
    recipes.remove(element);
    element.addTooltip("비활성화 됐습니다.");
} 

//<recipetype:immersiveengineering:alloy>.addRecipe("spin_iron_to_gold", <item:minecraft:iron_ingot> * 10, <tag:items:minecraft:wool>, 200, <item:minecraft:gold_ingot> * 2);