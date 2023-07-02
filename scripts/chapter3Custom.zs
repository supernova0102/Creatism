//smtihing
//smithing.addRecipe("",,c3core,);


//deployer_application
//<recipetype:create:item_application>.addRecipe("",[],c3core,,true);

//return to casing
/*<recipetype:create:item_application>.addRecipe("return_",[c3core,]
,,<item:immersiveengineering:screwdriver>,false);*/

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
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:toolupgrade_railgun_capacitors>))
);

//heat_sink
recipes.remove(<item:immersiveengineering:toolupgrade_railgun_capacitors>);

<recipetype:create:sequenced_assembly>.addRecipe(
	<recipetype:create:sequenced_assembly>
	.builder("heat_sink")
	.transitionTo(<item:createindustry:heavy_plate>)
	.require(<item:createindustry:heavy_plate>)
	.loops(8)
	.addOutput(<item:immersiveengineering:toolupgrade_railgun_capacitors>, 1)
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

var c3machines = [
	[<item:thermal:machine_furnace>,<item:minecraft:furnace>],
	[<item:thermal:machine_sawmill>,<item:thermal:saw_blade>],
	[<item:thermal:machine_pulverizer>,<item:create:millstone>],
	[<item:thermal:machine_smelter>,<item:minecraft:blast_furnace>],
	[<item:thermal:machine_insolator>,<item:farmersdelight:organic_compost>],
	[<item:thermal:machine_centrifuge>,<item:create:rotation_speed_controller>],
	[<item:thermal:machine_press>,<item:minecraft:anvil>],
	[<item:thermal:machine_crucible>,<item:create:basin>],
	[<item:thermal:machine_chiller>,<item:minecraft:packed_ice>],
	[<item:thermal:machine_refinery>,<item:create:fluid_tank>],
	[<item:thermal:machine_pyrolyzer>,<item:minecraft:campfire>],
	[<item:thermal:machine_bottler>,<item:create:spout>],
	[<item:thermal:machine_brewer>,<item:minecraft:brewing_stand>],
	[<item:thermal:machine_crystallizer>,<item:thermal:obsidian_glass>],
	[<item:thermal:machine_crafter>,<item:minecraft:crafting_table>],
	[<item:mininggadgets:modificationtable>,<item:mininggadgets:upgrade_empty>]
];

for index, element in c3machines{
	recipes.remove(element[0]);
	smithing.addRecipe("smithing_c3_"+index,element[0],c3core,element[1]);
	<recipetype:create:item_application>.addRecipe("hand_c3_"+index,[element[0]],c3core,element[1],true);
	<recipetype:create:item_application>.addRecipe("return_c3_"+index,[c3core,element[1]]
,element[0],<item:immersiveengineering:screwdriver>,false);
<recipetype:create:item_application>.addRecipe("return2_c3_"+index,[c3core,element[1]]
,element[0],<item:createindustry:screwdriver>,false);
}

recipes.remove(<item:mininggadgets:upgrade_empty>);
stoneCutter.addRecipe("mininggadget_upgrade",<item:mininggadgets:upgrade_empty>*4,c3core);




