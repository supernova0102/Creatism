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
	<recipetype:create:item_application>.addRecipe("hand_c3_"+index,[element[0]],c3core,element[1],false);
	<recipetype:create:item_application>.addRecipe("return_c3_"+index,[c3core,element[1]]
,element[0],<item:immersiveengineering:screwdriver>,true);
<recipetype:create:item_application>.addRecipe("return2_c3_"+index,[c3core,element[1]]
,element[0],<item:createindustry:screwdriver>.anyDamage(),true);
}

recipes.remove(<item:mininggadgets:upgrade_empty>);
stoneCutter.addRecipe("mininggadget_upgrade",<item:mininggadgets:upgrade_empty>*4,c3core);


//way to ae2
<recipetype:create:item_application>.remove(<item:createindustry:heavy_machinery_casing>);
<recipetype:create:item_application>.addRecipe("heavy_machinery_casing",[<item:createindustry:heavy_machinery_casing>],<item:createindustry:steel_mechanism>,<item:createindustry:steel_casing>,false);

<recipetype:ae2:inscriber>.remove(<item:ae2:printed_calculation_processor>);
<recipetype:ae2:inscriber>.remove(<item:ae2:printed_engineering_processor>);
<recipetype:ae2:inscriber>.remove(<item:ae2:printed_logic_processor>);

<recipetype:create:sequenced_assembly>.remove(<item:create_dd:inductive_mechanism>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("logistics_mechanism")
	.transitionTo(<item:createindustry:steel_mechanism>)
	.require(<item:createindustry:steel_mechanism>)
	.addOutput(<item:create_dd:inductive_mechanism>,1)
	.loops(1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:supplementaries:wrench>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:hammer>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:wirecutter>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:ae2:fluix_dust>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:ae2:logic_processor>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:cogwheel>))
);


<recipetype:create:sequenced_assembly>.remove(<item:create_dd:calculation_mechanism>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("calculation_mechanism")
	.transitionTo(<item:createindustry:steel_mechanism>)
	.require(<item:createindustry:steel_mechanism>)
	.addOutput(<item:create_dd:inductive_mechanism>,1)
	.loops(1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:supplementaries:wrench>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:hammer>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:wirecutter>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:ae2:fluix_dust>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:ae2:calculation_processor>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:cogwheel>))
);

recipes.remove(<item:ae2:controller>);

<recipetype:create:mechanical_crafting>.addRecipe("ae2_controller",<item:ae2:controller>*8,[
	[<item:createindustry:heavy_machinery_casing>,<item:createindustry:heavy_machinery_casing>,<item:create_dd:calculation_mechanism>,<item:createindustry:heavy_machinery_casing>,<item:createindustry:heavy_machinery_casing>],
	[<item:createindustry:heavy_machinery_casing>,<item:ae2:engineering_processor>,<item:ae2:engineering_processor>,<item:ae2:engineering_processor>,<item:createindustry:heavy_machinery_casing>],
	[<item:create_dd:inductive_mechanism>,<item:ae2:engineering_processor>,<item:ae2:smooth_sky_stone_block>,<item:ae2:engineering_processor>,<item:create_dd:inductive_mechanism>],
	[<item:createindustry:heavy_machinery_casing>,<item:ae2:engineering_processor>,<item:ae2:engineering_processor>,<item:ae2:engineering_processor>,<item:createindustry:heavy_machinery_casing>],
	[<item:createindustry:heavy_machinery_casing>,<item:createindustry:heavy_machinery_casing>,<item:create_dd:calculation_mechanism>,<item:createindustry:heavy_machinery_casing>,<item:createindustry:heavy_machinery_casing>],
]);

<recipetype:create:milling>.remove(<item:ae2:fluix_dust>);


//silicon
furnace.remove(<item:ae2:silicon>);
blastFurnace.remove(<item:ae2:silicon>);
<recipetype:create:compacting>.addRecipe("silicon1",<constant:create:heat_condition:superheated>,[<item:ae2:silicon>],[<item:thermal:polished_slag>,<item:thermal:ender_pearl_dust>],[<fluid:minecraft:lava>*1000],200);
<recipetype:create:compacting>.addRecipe("silicon2",<constant:create:heat_condition:superheated>,[<item:ae2:silicon>*4],[<item:thermal:polished_rich_slag>,<item:thermal:ender_pearl_dust>],[<fluid:minecraft:lava>*1000],200);
blastFurnace.addRecipe("skydust_smelting",<item:ae2:silicon>, <item:ae2:sky_dust>, 2.0, 40);
<recipetype:create:mixing>.addRecipe("skydust",<constant:create:heat_condition:superheated>,[<item:ae2:sky_dust>*3],[<tag:items:forge:dusts/netherite>,<tag:items:forge:dusts/iron>*4,<tag:items:forge:dusts/diamond>*2,<tag:items:forge:dusts/glowstone>*8],[<fluid:createindustry:lubrication_oil> * 100],1000);

var aecore = <item:ae2:silicon>;
var aemachines = [
	[<item:ae2:energy_acceptor>,<item:createaddition:capacitor>],
	[<item:ae2:drive>,<item:storagedrawers:controller>]
];

for index, element in aemachines{
	recipes.remove(element[0]);
	smithing.addRecipe("smithing_ae_"+index,element[0],c3core,element[1]);
}
