//var
var c3core = <item:thermal:machine_frame>;

//machine_frame
recipes.remove(<item:thermal:machine_frame>);

craftingTable.addShaped("machine_frame",<item:thermal:machine_frame>,
[[<item:thermal:redstone_servo>,<item:thermal:redstone_servo>,<item:thermal:redstone_servo>],
[<item:thermal:redstone_servo>,<item:immersiveengineering:heavy_engineering>,<item:thermal:redstone_servo>],
[<item:thermal:redstone_servo>,<item:thermal:redstone_servo>,<item:thermal:redstone_servo>]]);

//redstone_servo
recipes.remove(<item:thermal:redstone_servo>);

<recipetype:create:sequenced_assembly>.addRecipe(
	<recipetype:create:sequenced_assembly>
	.builder("redstone_servo")
	.transitionTo(<item:create_sa:heat_engine>)
	.require(<item:create_sa:heat_engine>)
	.loops(4)
	.addOutput(<item:thermal:redstone_servo>, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:thermal:rf_coil>))
);



//heat_engine
<recipetype:create:sequenced_assembly>.remove(<item:create_sa:heat_engine>);

<recipetype:create:sequenced_assembly>.addRecipe(
	<recipetype:create:sequenced_assembly>
	.builder("heat_engine")
	.transitionTo(<item:thermal:invar_plate>)
	.require(<tag:items:forge:plates/invar>)
	.loops(2)
	.addOutput(<item:create_sa:heat_engine>, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:precision_mechanism>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:gears/invar>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:pneumaticcraft:heat_sink>))
);

//heat_sink
recipes.remove(<item:pneumaticcraft:heat_sink>);

<recipetype:create:sequenced_assembly>.addRecipe(
	<recipetype:create:sequenced_assembly>
	.builder("heat_sink")
	.transitionTo(<item:createindustry:heavy_plate>)
	.require(<item:createindustry:heavy_plate>)
	.loops(8)
	.addOutput(<item:pneumaticcraft:heat_sink>, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createindustry:heavy_plate>))
    .addStep<mods.createtweaker.CuttingRecipe>((rb) => rb.duration(20))
	.addStep<mods.createtweaker.FillingRecipe>((rb) => rb.require(<fluid:minecraft:lava>*125))
);

//rf_coil
recipes.remove(<item:thermal:rf_coil>);

<recipetype:immersiveengineering:blueprint>.addRecipe("rf_coil","components",
[<item:minecraft:enchanted_book>.withTag(
    {StoredEnchantments: [{lvl: 5, id: "minecraft:efficiency"}]}),<item:immersiveengineering:graphite_electrode>,<tag:items:forge:wires/electrum>*2,<item:thermal:cured_rubber>*4,<tag:items:forge:storage_blocks/redstone>],<item:thermal:rf_coil>);
//electrode

<recipetype:create:sequenced_assembly>.addRecipe(
	<recipetype:create:sequenced_assembly>
	.builder("electrode")
	.transitionTo(<item:immersiveengineering:ingot_hop_graphite>)
	.require(<item:immersiveengineering:ingot_hop_graphite>)
	.loops(7)
	
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:ingot_hop_graphite>))
    .addOutput(<item:immersiveengineering:graphite_electrode>.withTag({graphDmg: 0}), 1)
    .addStep<mods.createtweaker.PressingRecipe>((rb) => rb.duration(40))
);

//machines

recipes.remove(<item:thermal:machine_furnace>);
recipes.remove(<item:thermal:machine_sawmill>);
recipes.remove(<item:thermal:machine_pulverizer>);
recipes.remove(<item:thermal:machine_smelter>);
recipes.remove(<item:thermal:machine_insolator>);
recipes.remove(<item:thermal:machine_centrifuge>);
recipes.remove(<item:thermal:machine_press>);
recipes.remove(<item:thermal:machine_crucible>);
recipes.remove(<item:thermal:machine_chiller>);
recipes.remove(<item:thermal:machine_refinery>);
recipes.remove(<item:thermal:machine_pyrolyzer>);
recipes.remove(<item:thermal:machine_bottler>);
recipes.remove(<item:thermal:machine_brewer>);
recipes.remove(<item:thermal:machine_crystallizer>);
recipes.remove(<item:thermal:machine_crafter>);

//smtihing
//smithing.addRecipe("",,c3core,);
smithing.addRecipe("machine_furnace",<item:thermal:machine_furnace>,c3core,<item:minecraft:furnace>);
smithing.addRecipe("machine_sawmill",<item:thermal:machine_sawmill>,c3core,<item:thermal:saw_blade>);
smithing.addRecipe("machine_pulverizer",<item:thermal:machine_pulverizer>,c3core,<item:create:millstone>);
smithing.addRecipe("machine_smelter",<item:thermal:machine_smelter>,c3core,<item:minecraft:blast_furnace>);
smithing.addRecipe("machine_insolator",<item:thermal:machine_insolator>,c3core,<item:farmersdelight:organic_compost>);
smithing.addRecipe("machine_centrifuge",<item:thermal:machine_centrifuge>,c3core,<item:create:rotation_speed_controller>);
smithing.addRecipe("machine_press",<item:thermal:machine_press>,c3core,<item:minecraft:anvil>);
smithing.addRecipe("machine_crucible",<item:thermal:machine_crucible>,c3core,<item:create:basin>);
smithing.addRecipe("machine_chiller",<item:thermal:machine_chiller>,c3core,<item:minecraft:packed_ice>);
smithing.addRecipe("machine_refinery",<item:thermal:machine_refinery>,c3core,<item:create:fluid_tank>);
smithing.addRecipe("machine_pyrolyzer",<item:thermal:machine_pyrolyzer>,c3core,<item:minecraft:campfire>);
smithing.addRecipe("machine_bottler",<item:thermal:machine_bottler>,c3core,<item:create:spout>);
smithing.addRecipe("machine_brewer",<item:thermal:machine_brewer>,c3core,<item:minecraft:brewing_stand>);
smithing.addRecipe("machine_crystallizer",<item:thermal:machine_crystallizer>,c3core,<item:thermal:obsidian_glass>);
smithing.addRecipe("machine_crafter",<item:thermal:machine_crafter>,c3core,<item:minecraft:crafting_table>);

//deployer_application
//<recipetype:create:item_application>.addRecipe("",[],c3core,,true);
<recipetype:create:item_application>.addRecipe("machine_furnace_hand",[<item:thermal:machine_furnace>],c3core,<item:minecraft:furnace>,true);
<recipetype:create:item_application>.addRecipe("machine_sawmill_hand",[<item:thermal:machine_sawmill>],c3core,<item:thermal:saw_blade>,true);
<recipetype:create:item_application>.addRecipe("machine_pulverizer_hand",[<item:thermal:machine_pulverizer>],c3core,<item:create:millstone>,true);
<recipetype:create:item_application>.addRecipe("machine_smelter_hand",[<item:thermal:machine_smelter>],c3core,<item:minecraft:blast_furnace>,true);
<recipetype:create:item_application>.addRecipe("machine_insolator_hand",[<item:thermal:machine_insolator>],c3core,<item:farmersdelight:organic_compost>,true);
<recipetype:create:item_application>.addRecipe("machine_centrifuge_hand",[<item:thermal:machine_centrifuge>],c3core,<item:create:rotation_speed_controller>,true);
<recipetype:create:item_application>.addRecipe("machine_press_hand",[<item:thermal:machine_press>],c3core,<item:minecraft:anvil>,true);
<recipetype:create:item_application>.addRecipe("machine_crucible_hand",[<item:thermal:machine_crucible>],c3core,<item:create:basin>,true);
<recipetype:create:item_application>.addRecipe("machine_chiller_hand",[<item:thermal:machine_chiller>],c3core,<item:minecraft:packed_ice>,true);
<recipetype:create:item_application>.addRecipe("machine_refinery_hand",[<item:thermal:machine_refinery>],c3core,<item:create:fluid_tank>,true);
<recipetype:create:item_application>.addRecipe("machine_pyrolyzer_hand",[<item:thermal:machine_pyrolyzer>],c3core,<item:minecraft:campfire>,true);
<recipetype:create:item_application>.addRecipe("machine_bottler_hand",[<item:thermal:machine_bottler>],c3core,<item:create:spout>,true);
<recipetype:create:item_application>.addRecipe("machine_brewer_hand",[<item:thermal:machine_brewer>],c3core,<item:minecraft:brewing_stand>,true);
<recipetype:create:item_application>.addRecipe("machine_crystallizer_hand",[<item:thermal:machine_crystallizer>],c3core,<item:thermal:obsidian_glass>,true);
<recipetype:create:item_application>.addRecipe("machine_crafter_hand",[<item:thermal:machine_crafter>],c3core,<item:minecraft:crafting_table>,true);


//return to casing
/*<recipetype:create:item_application>.addRecipe("return_",[c3core,]
,,<item:immersiveengineering:screwdriver>,false);*/
<recipetype:create:item_application>.addRecipe("return_furnace",[c3core,<item:minecraft:furnace>]
,<item:thermal:machine_furnace>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_sawmill",[c3core,<item:thermal:saw_blade>]
,<item:thermal:machine_sawmill>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_pulverizeer",[c3core,<item:create:millstone>]
,<item:thermal:machine_pulverizer>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_smelter",[c3core,<item:minecraft:blast_furnace>]
,<item:thermal:machine_smelter>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_insolator",[c3core,<item:farmersdelight:organic_compost>]
,<item:thermal:machine_insolator>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_centrifuge",[c3core,<item:create:rotation_speed_controller>]
,<item:thermal:machine_centrifuge>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_press",[c3core,<item:minecraft:anvil>]
,<item:thermal:machine_press>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_crucible",[c3core,<item:create:basin>]
,<item:thermal:machine_crucible>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_chiller",[c3core,<item:minecraft:packed_ice>]
,<item:thermal:machine_chiller>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_refinery",[c3core,<item:create:fluid_tank>]
,<item:thermal:machine_refinery>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_pyrolyzer",[c3core,<item:minecraft:campfire>]
,<item:thermal:machine_pyrolyzer>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_bottler",[c3core,<item:create:spout>]
,<item:thermal:machine_bottler>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_brewer",[c3core,<item:minecraft:brewing_stand>]
,<item:thermal:machine_brewer>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_crystallizer",[c3core,<item:thermal:obsidian_glass>]
,<item:thermal:machine_crystallizer>,<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return_crafter",[c3core,<item:minecraft:crafting_table>]
,<item:thermal:machine_crafter>,<item:immersiveengineering:screwdriver>,false);