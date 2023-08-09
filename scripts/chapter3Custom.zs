//smtihing
//smithing.addRecipe("",,c3core,);


//deployer_application
//<recipetype:create:item_application>.addRecipe("",[],c3core,,true);

//return to casing
/*<recipetype:create:item_application>.addRecipe("return_",[c3core,]
,,<item:immersiveengineering:screwdriver>,false);*/

//var
var c3core = <item:thermal:machine_frame>;

//heat engine
recipes.remove(<item:create_sa:heat_engine>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("heat_engine")
	.transitionTo(<item:create_sa:incomplete_heat_engine>)
	.require(<tag:items:forge:plates/invar>)
	.addOutput(<item:create_sa:heat_engine>,1)
	.loops(3)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:thermal:invar_gear>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:thermal:invar_plate>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:copper_sheet>))
);

//hydraric engine
recipes.remove(<item:create_sa:hydraulic_engine>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("hydraulic_engine")
	.transitionTo(<item:create_sa:incomplete_hydraulic_engine>)
	.require(<item:create_dd:sealed_mechanism>)
	.addOutput(<item:create_sa:hydraulic_engine>,1)
	.loops(1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:fluid_pipe>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:plates/copper>))
	.addStep<mods.createtweaker.FillingRecipe>((a) => a.require(<fluid:minecraft:water> * 500))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:glass_panes/colorless>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:thermal:fluid_tank_augment>))
);


//steam engine
recipes.remove(<item:create_sa:steam_engine>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("steam_engine")
	.transitionTo(<item:create_sa:incomplete_steam_engine>)
	.require(<item:create:precision_mechanism>)
	.addOutput(<item:create_sa:steam_engine>,1)
	.loops(1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:flywheel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:plates/gold>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:thermal:fluid_tank_augment>))
);


//redstone servo
recipes.remove(<item:thermal:redstone_servo>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("redstone_servo")
	.transitionTo(<item:createindustry:steel_mechanism>)
	.require(<item:createindustry:steel_mechanism>)
	.addOutput(<item:thermal:redstone_servo>,1)
	.loops(1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:thermal:invar_plate>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:thermal:rf_coil_augment>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:graphite_electrode>.withTag({graphDmg: 0})))
);


//redstone coil
recipes.remove(<item:thermal:rf_coil>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("redstone_flux_coil")
	.transitionTo(<item:createaddition:gold_rod>)
	.require(<item:createaddition:gold_rod>)
	.addOutput(<item:thermal:rf_coil>,1)
	.loops(6)
	.addStep<mods.createtweaker.PressingRecipe>((rb) => rb.duration(20))
	.addStep<mods.createtweaker.FillingRecipe>((a) => a.require(<fluid:immersiveengineering:redstone_acid> * 1000))
);
//machine_frame
recipes.remove(<item:thermal:machine_frame>);

craftingTable.addShaped("machine_frame",<item:thermal:machine_frame>,
[[<item:thermal:redstone_servo>,<item:thermal:redstone_servo>,<item:thermal:redstone_servo>],
[<item:thermal:redstone_servo>,<item:immersiveengineering:heavy_engineering>,<item:thermal:redstone_servo>],
[<item:thermal:redstone_servo>,<item:thermal:redstone_servo>,<item:thermal:redstone_servo>]]);

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
	[<item:mininggadgets:modificationtable>,<item:mininggadgets:upgrade_empty>],
	[<item:thermal:energy_cell_frame>,<item:immersiveengineering:component_steel>],
	[<item:thermal:fluid_cell_frame>,<item:create_dd:sealed_mechanism>]
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
<recipetype:create:item_application>.remove(<item:createindustry:steel_casing>);
<recipetype:create:item_application>.remove(<item:createindustry:heavy_machinery_casing>);
<recipetype:create:item_application>.addRecipe("steel_casing",[<item:createindustry:steel_casing>],<item:createindustry:hardened_planks>,<item:createindustry:steel_mechanism>,false);
<recipetype:create:item_application>.addRecipe("heavy_machinery_casing",[<item:createindustry:heavy_machinery_casing>],<item:createindustry:steel_casing>,<item:createindustry:heavy_plate>,false);

<recipetype:ae2:inscriber>.remove(<item:ae2:printed_calculation_processor>);
<recipetype:ae2:inscriber>.remove(<item:ae2:printed_engineering_processor>);
<recipetype:ae2:inscriber>.remove(<item:ae2:printed_logic_processor>);

<recipetype:create:sequenced_assembly>.remove(<item:create_dd:inductive_mechanism>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("logistics_mechanism")
	.transitionTo(<item:create_dd:incomplete_inductive_mechanism>)
	.require(<item:createindustry:steel_mechanism>)
	.addOutput(<item:create_dd:inductive_mechanism>,1)
	.loops(1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:hammer>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:supplementaries:wrench>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:wirecutter>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:ae2:fluix_dust>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:ae2:logic_processor>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:cogwheel>))
);


<recipetype:create:sequenced_assembly>.remove(<item:create_dd:calculation_mechanism>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("calculation_mechanism")
	.transitionTo(<item:create_dd:incomplete_calculation_mechanism>)
	.require(<item:createindustry:steel_mechanism>)
	.addOutput(<item:create_dd:calculation_mechanism>,1)
	.loops(1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:supplementaries:wrench>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:hammer>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:wirecutter>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:ae2:fluix_dust>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:ae2:calculation_processor>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:cogwheel>))
);

recipes.remove(<item:ae2:controller>);

<recipetype:create:mechanical_crafting>.addRecipe("ae2_controller",<item:ae2:controller>*4,[
	[<item:createindustry:heavy_machinery_casing>,<item:create_dd:calculation_mechanism>,<item:createindustry:heavy_machinery_casing>],
	[<item:create_dd:inductive_mechanism>,<item:ae2:engineering_processor>,<item:create_dd:inductive_mechanism>],
	[<item:createindustry:heavy_machinery_casing>,<item:create_dd:calculation_mechanism>,<item:createindustry:heavy_machinery_casing>],
]);

<recipetype:create:milling>.remove(<item:ae2:fluix_dust>);


//silicon
furnace.remove(<item:ae2:silicon>);
blastFurnace.remove(<item:ae2:silicon>);
<recipetype:create:compacting>.addRecipe("silicon1",<constant:create:heat_condition:superheated>,[<item:ae2:silicon>],[<item:thermal:polished_slag>,<item:ae2:sky_dust>],[<fluid:minecraft:lava>*1000],200);
<recipetype:create:compacting>.addRecipe("silicon2",<constant:create:heat_condition:superheated>,[<item:ae2:silicon>*4],[<item:thermal:polished_rich_slag>,<item:ae2:sky_dust>],[<fluid:minecraft:lava>*1000],200);
blastFurnace.addRecipe("skydust_smelting",<item:ae2:silicon>, <item:ae2:sky_dust>, 2.0, 40);
<recipetype:create:mixing>.addRecipe("skydust",<constant:create:heat_condition:superheated>,[<item:ae2:sky_dust>*3],[<tag:items:forge:dusts/netherite>,<tag:items:forge:dusts/iron>*4,<tag:items:forge:dusts/diamond>*2,<tag:items:forge:dusts/glowstone>*8],[<fluid:thermal:ender> * 1000],1000);

<recipetype:create:mixing>.remove(<item:ae2:fluix_crystal>);

var aecore = <item:ae2:silicon>;
var aemachines = [
	[<item:ae2:energy_acceptor>,<item:createaddition:capacitor>],
	[<item:ae2:drive>,<item:storagedrawers:controller>]
];

for index, element in aemachines{
	recipes.remove(element[0]);
	smithing.addRecipe("smithing_ae_"+index,element[0],c3core,element[1]);
}



// steel mechanism
<recipetype:create:sequenced_assembly>.remove(<item:createindustry:steel_mechanism>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("steel_mechanism")
	.transitionTo(<item:createindustry:unprocessed_steel_mechanism>)
	.require(<item:create:precision_mechanism>)
	.addOutput(<item:createindustry:steel_mechanism>,4)
	.addOutput(<item:create_dd:steel_sheet>,3)
	.addOutput(<item:create:precision_mechanism>,1)
	.addOutput(<item:thermal:steel_gear>,2)
	.loops(4)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:plates/steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:gears/steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createindustry:water_insulation>.anyDamage()))
	
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("steel_mechanism_1")
	.transitionTo(<item:createindustry:unprocessed_steel_mechanism>)
	.require(<item:create:precision_mechanism>)
	.addOutput(<item:createindustry:steel_mechanism>*2,6)
	.addOutput(<item:create_dd:steel_sheet>,3)
	.addOutput(<item:create:precision_mechanism>,1)
	.addOutput(<item:thermal:steel_gear>,2)
	.loops(4)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:gears/steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:plates/steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createindustry:screw>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createindustry:water_insulation>.anyDamage()))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("steel_mechanism_all")
	.transitionTo(<item:createindustry:unprocessed_steel_mechanism>)
	.require(<item:create:precision_mechanism>)
	.addOutput(<item:createindustry:steel_mechanism>*2,4)
	.loops(4)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createindustry:screw>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:gears/steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:plates/steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createindustry:screwdriver>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createindustry:water_insulation>.anyDamage()))
);


//heavy plate
<recipetype:create:sequenced_assembly>.remove(<item:createindustry:heavy_plate>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("heavy_plate_1")
	.transitionTo(<item:createindustry:unprocessed_heavy_plate>)
	.require(<item:minecraft:netherite_ingot>)
	.addOutput(<item:createindustry:heavy_plate>,4)
	.addOutput(<item:minecraft:netherite_ingot>,2)
	.addOutput(<item:minecraft:netherite_ingot>*2,2)
	.addOutput(<item:minecraft:netherite_ingot>*3,1)
	.addOutput(<item:minecraft:netherite_ingot>*4,1)
	.loops(10)
	.addStep<mods.createtweaker.PressingRecipe>((rb) => rb.duration(60))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("heavy_plate_2")
	.transitionTo(<item:createindustry:unprocessed_heavy_plate>)
	.require(<item:minecraft:netherite_ingot>)
	.addOutput(<item:createindustry:heavy_plate>,4)
	.addOutput(<item:minecraft:netherite_ingot>*2,2)
	.addOutput(<item:minecraft:netherite_ingot>*3,1)
	.addOutput(<item:minecraft:netherite_ingot>*4,1)
	.loops(10)
	.addStep<mods.createtweaker.PressingRecipe>((rb) => rb.duration(40))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:dusts/steel>))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("heavy_plate_3")
	.transitionTo(<item:createindustry:unprocessed_heavy_plate>)
	.require(<item:minecraft:netherite_ingot>)
	.addOutput(<item:createindustry:heavy_plate>,4)
	.loops(10)
	.addStep<mods.createtweaker.PressingRecipe>((rb) => rb.duration(20))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:dusts/steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createindustry:thermite_powder>))
);

