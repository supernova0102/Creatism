//light_engineering blocck = main of tier1

recipes.remove(<item:immersiveengineering:light_engineering>);

craftingTable.addShaped("light_engineering_block",<item:immersiveengineering:light_engineering>,[[<item:immersiveengineering:component_iron>,<item:immersiveengineering:component_iron>,<item:immersiveengineering:component_iron>],[<item:immersiveengineering:component_iron>,<item:create:andesite_casing>,<item:immersiveengineering:component_iron>],[<item:immersiveengineering:component_iron>,<item:immersiveengineering:component_iron>,<item:immersiveengineering:component_iron>]]);


//component_iron
recipes.remove(<item:immersiveengineering:component_iron>);

craftingTable.addShaped("iron_component_recipe_changed",<item:immersiveengineering:component_iron>,
[[<item:minecraft:air>,<item:create:andesite_alloy>,<item:minecraft:air>],[<tag:items:forge:cogwheels>,<item:minecraft:copper_ingot>,<tag:items:forge:cogwheels>],[<item:minecraft:air>,<item:minecraft:iron_ingot>,<item:minecraft:air>]]);



<recipetype:create:sequenced_assembly>.addRecipe(
	<recipetype:create:sequenced_assembly>
	.builder("high_efficiency_iron_component_making")
	.transitionTo(<item:immersiveengineering:component_iron>)
	.require(<item:create:andesite_alloy>)
	.loops(2)
	.addOutput(<item:immersiveengineering:component_iron>*4, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:cogwheels>) )
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:ingots/iron>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:ingots/copper>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:cogwheels>))
);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("high_efficiency_iron_component_making2")
	.transitionTo(<item:create_connected_blocks:incomplete_iron_reinforcement>)
	.require(<item:create:andesite_alloy>)
	.loops(2)
	.addOutput(<item:immersiveengineering:component_iron>*4, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:cogwheels>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:ingots/zinc>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:ingots/copper>))
	
);


//andesite_casing
<recipetype:create:item_application>.remove(<item:create:andesite_casing>);

<recipetype:create:item_application>.addRecipe("on_hand_casing1_making",[<item:create:andesite_casing>],<tag:items:forge:stripped_logs>, <item:immersiveengineering:component_iron>, false);


//andesite_alloy
recipes.remove(<item:create:andesite_alloy>);

craftingTable.addShaped("changed_andesite_alloy", <item:create:andesite_alloy>,[[<item:minecraft:andesite>,<item:supplementaries:daub>],[<item:supplementaries:daub>,<item:minecraft:andesite>]]);

<recipetype:create:mixing>.addRecipe("andesite_alloy",<constant:create:heat_condition:none>,[<item:create:andesite_alloy>%100],[<item:supplementaries:daub>,<item:minecraft:andesite>],[] as crafttweaker.api.fluid.FluidIngredient[],100);


//washing gravel
<recipetype:create:splashing>.removeByInput(<item:minecraft:gravel>);

<recipetype:create:splashing>.addRecipe("washing_gravel",[
<item:exnihilosequentia:stone_pebble>%10, <item:exnihilosequentia:granite_pebble>%5,<item:exnihilosequentia:andesite_pebble>%15,<item:exnihilosequentia:calcite_pebble>%5,<item:exnihilosequentia:diorite_pebble>%5,<item:exnihilosequentia:dripstone_pebble>%10,<item:exnihilosequentia:tuff_pebble>%10,
<item:minecraft:flint>%50,
<item:create:copper_nugget>%8, <item:minecraft:iron_nugget>%8, <item:create:zinc_nugget>%8,
<item:minecraft:gold_nugget>%3,
],<item:minecraft:gravel>, 100);
