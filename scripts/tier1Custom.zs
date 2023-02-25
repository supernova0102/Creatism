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
	.transitionTo(<item:create:andesite_alloy>)
	.require(<item:create:andesite_alloy>)
	.loops(1)
	.addOutput(<item:immersiveengineering:component_iron>*2, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:cogwheels>) )

	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:ingots/iron>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:ingots/copper>))

	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:andesite_alloy>))

);

<recipetype:create:sequenced_assembly>.addRecipe(
	<recipetype:create:sequenced_assembly>
	.builder("low_tier_automation_iron_component")
	.transitionTo(<item:create:andesite_alloy>)
	.require(<item:create:andesite_alloy>)
	.loops(1)
	.addOutput(<item:immersiveengineering:component_iron>, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:cogwheels>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:andesite_alloy>))
);

//andesite_casing
<recipetype:create:item_application>.remove(<item:create:andesite_casing>);

<recipetype:create:item_application>.addRecipe("on_hand_casing1_making",[<item:create:andesite_casing>],<tag:items:forge:stripped_logs>, <item:immersiveengineering:component_iron>, false);


//andesite_alloy
recipes.remove(<item:create:andesite_alloy>);
<recipetype:create:mixing>.remove(<item:create:andesite_alloy>);


craftingTable.addShaped("changed_andesite_alloy", <item:create:andesite_alloy>,[[<item:minecraft:andesite>,<item:supplementaries:daub>],[<item:supplementaries:daub>,<item:minecraft:andesite>]]);

<recipetype:create:mixing>.addRecipe("andesite_alloy",<constant:create:heat_condition:none>,[<item:create:andesite_alloy>%100],[<item:supplementaries:daub>,<item:minecraft:andesite>],[] as crafttweaker.api.fluid.FluidIngredient[],100);


//daub, resource for andesite alloy

recipes.remove(<item:supplementaries:daub>);

craftingTable.addShapeless("daub",<item:supplementaries:daub>*2,[<item:exnihilosequentia:porcelain_clay>,<item:exnihilosequentia:porcelain_clay>,<item:exnihilosequentia:porcelain_clay>,<item:exnihilosequentia:porcelain_clay>]);


//washing gravel

/*
<recipetype:create:splashing>.removeByInput(<item:minecraft:gravel>);

<recipetype:create:splashing>.addRecipe("washing_gravel",[
<item:minecraft:flint>%50,
<item:create:copper_nugget>%8, <item:minecraft:iron_nugget>%8, <item:create:zinc_nugget>%8,
<item:minecraft:gold_nugget>%3
],<item:minecraft:gravel>, 100);

<recipetype:create:splashing>.addRecipe("washing_dirt",[
<item:exnihilosequentia:stone_pebble>%10, <item:exnihilosequentia:granite_pebble>%5,<item:exnihilosequentia:andesite_pebble>%15,<item:exnihilosequentia:calcite_pebble>%5,<item:exnihilosequentia:diorite_pebble>%5,<item:exnihilosequentia:dripstone_pebble>%10,<item:exnihilosequentia:tuff_pebble>%10
],<item:minecraft:dirt>, 100);
*/



//drill for mech drill
stoneCutter.remove(<item:createindustry:drill_head>);
craftingTable.addShaped("drill_head",<item:createindustry:drill_head>,[
[<item:create:iron_sheet>,<item:minecraft:air>,<item:minecraft:air>],
[<item:minecraft:air>,<item:minecraft:iron_ingot>,<item:create:andesite_alloy>],
[<item:minecraft:air>,<item:create:andesite_alloy>,<item:create:andesite_alloy>]]);


//brass hand for deployer
recipes.remove(<item:create:brass_hand>);
craftingTable.addShaped("brass_hand",<item:create:brass_hand>,[
[<item:minecraft:air>,<item:create:copper_sheet>,<item:minecraft:air>],[<item:create:copper_sheet>,<item:create:golden_sheet>,<item:create:copper_sheet>],[<item:create:andesite_alloy>,<item:createaddition:zinc_sheet>,<item:create:andesite_alloy>]]);

//tier1 base machines
//stonecutter to make
recipes.remove(<item:create:redstone_contact>);
recipes.remove(<item:create:mechanical_bearing>);
recipes.remove(<item:create:rope_pulley>);
recipes.remove(<item:create:mechanical_piston>);
recipes.remove(<item:create:mechanical_harvester>);
recipes.remove(<item:create:mechanical_plough>);
recipes.remove(<item:create:portable_storage_interface>);
recipes.remove(<item:create:andesite_funnel>);
recipes.remove(<item:create:andesite_tunnel>);

stoneCutter.addRecipe("redstone_contact",<item:create:redstone_contact>*2,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("mechanical_bearing",<item:create:mechanical_bearing>,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("rope_polley",<item:create:rope_pulley>,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("mechanical_piston",<item:create:mechanical_piston>,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("mechanical_harvester",<item:create:mechanical_harvester>*2,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("mechanical_plough",<item:create:mechanical_plough>*2,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("portable_storage_interface",<item:create:portable_storage_interface>*2,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("andesite_funnel",<item:create:andesite_funnel>*2,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("andesite_tunnel",<item:create:andesite_tunnel>*2,<item:immersiveengineering:light_engineering>);

//smithing to make
recipes.remove(<item:createaddition:rolling_mill>);
recipes.remove(<item:create:encased_fan>);
recipes.remove(<item:create:mechanical_saw>);
recipes.remove(<item:create:deployer>);
recipes.remove(<item:create_mechanical_extruder:mechanical_extruder>);
recipes.remove(<item:create:mechanical_press>);
recipes.remove(<item:create:mechanical_mixer>);
recipes.remove(<item:sliceanddice:slicer>);
recipes.remove(<item:createsifter:sifter>);
recipes.remove(<item:create:mechanical_drill>);

smithing.addRecipe("rolling_mill",<item:createaddition:rolling_mill>,<item:immersiveengineering:light_engineering>,<item:create:shaft>);
smithing.addRecipe("encased_fan",<item:create:encased_fan>,<item:immersiveengineering:light_engineering>,<item:create:propeller>);
smithing.addRecipe("mechanical_saw",<item:create:mechanical_saw>,<item:immersiveengineering:light_engineering>,<item:thermal:saw_blade>);
smithing.addRecipe("deployer",<item:create:deployer>,<item:immersiveengineering:light_engineering>,<item:create:brass_hand>);
smithing.addRecipe("mechanical_extruder",<item:create_mechanical_extruder:mechanical_extruder>,<item:immersiveengineering:light_engineering>,<item:create_crystal_clear:andesite_glass_casing>);
smithing.addRecipe("mechanical_press",<item:create:mechanical_press>,<item:immersiveengineering:light_engineering>,<item:minecraft:anvil>);
smithing.addRecipe("mechanical_mixer",<item:create:mechanical_mixer>,<item:immersiveengineering:light_engineering>,<item:create:whisk>);
smithing.addRecipe("slicer",<item:sliceanddice:slicer>,<item:immersiveengineering:light_engineering>,<item:farmersdelight:iron_knife>);
smithing.addRecipe("mechanical_drill",<item:create:mechanical_drill>,<item:immersiveengineering:light_engineering>,<item:createindustry:drill_head>);
smithing.addRecipe("sifter",<item:createsifter:sifter>,<item:immersiveengineering:light_engineering>,<tag:items:exnihilosequentia:sieves>);