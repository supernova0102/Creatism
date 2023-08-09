//heavy_engineering block = main tier 2 block
var c2core = <item:immersiveengineering:heavy_engineering>;
recipes.remove(c2core);

craftingTable.addShaped("heavy_engineering",c2core,
[[<item:immersiveengineering:component_steel>,<item:immersiveengineering:component_steel>,<item:immersiveengineering:component_steel>],
[<item:immersiveengineering:component_steel>,<item:immersiveengineering:light_engineering>,<item:immersiveengineering:component_steel>],
[<item:immersiveengineering:component_steel>,<item:immersiveengineering:component_steel>,<item:immersiveengineering:component_steel>]]);



//component_steel
recipes.remove(<item:immersiveengineering:component_steel>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("steel_component")
	.transitionTo(<item:immersiveengineering:component_iron>)
	.require(<item:immersiveengineering:component_iron>)
	.loops(1)
	.addOutput(<item:immersiveengineering:component_steel>, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:plates/steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:precision_mechanism>))
);




//rose_quartz
recipes.remove(<item:create:rose_quartz>);

<recipetype:create:mixing>.addRecipe("rose_quartz",<constant:create:heat_condition:none>,[<item:create:rose_quartz>*8%100],[<item:minecraft:amethyst_shard>*2,],[<fluid:thermal:redstone> * 250],250);
<recipetype:create:mixing>.addRecipe("budding_rose_quartz",<constant:create:heat_condition:heated>,[<item:geodeoplenty:budding_rose_quartz>%100],[<tag:items:forge:budding>,<item:ae2:quartz_block>],[<fluid:thermal:redstone> * 500],500);
//electron_tube
recipes.remove(<item:create:electron_tube>);

craftingTable.addShaped("hand_made_electron",<item:create:electron_tube>,[[<item:create_things_and_misc:rose_quartz_sheet>,<item:create_things_and_misc:rose_quartz_sheet>],[<item:create:andesite_alloy>,<item:create:andesite_alloy>]]);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("electron_tube_low_yield")
	.transitionTo(<item:create:polished_rose_quartz>)
	.require(<item:create:polished_rose_quartz>)
	.loops(1)
	.addOutput(<item:create:electron_tube>*4, 6)
	.addOutput(<item:create:rose_quartz>, 4)
	.addStep<mods.createtweaker.CuttingRecipe>((a) => a.duration(50))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:andesite_alloy>))
	.addStep<mods.createtweaker.CuttingRecipe>((a) => a.duration(50))

);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("electron_tube_high_yield")
	.transitionTo(<item:create:polished_rose_quartz>)
	.require(<item:create:polished_rose_quartz>)
	.loops(1)
	.addOutput(<item:create:electron_tube>*4, 1)
	.addStep<mods.createtweaker.FillingRecipe>((a) => a.require(<fluid:thermal:glowstone> * 250))
	.addStep<mods.createtweaker.CuttingRecipe>((a) => a.duration(50))
	.addStep<mods.createtweaker.FillingRecipe>((a) => a.require(<fluid:thermal:glowstone> * 250))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:andesite_alloy>))
	.addStep<mods.createtweaker.CuttingRecipe>((a) => a.duration(50))
);

//energized_glowstone
<recipetype:create:mixing>.addRecipe("energized_glowstone",<constant:create:heat_condition:none>,[<fluid:thermal:glowstone> * 250],[<item:minecraft:glowstone_dust>*2],[<fluid:immersiveengineering:potion>.withTag({Potion: "minecraft:long_night_vision"}) * 1000],400);

//precision_mechanism

<recipetype:create:sequenced_assembly>.remove(<item:create:precision_mechanism>);


<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("precision_mechanism")
	.transitionTo(<item:create:incomplete_precision_mechanism>)
	.require(<item:create:golden_sheet>)
	.loops(2)
	.addOutput(<item:create:precision_mechanism>, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:electron_tube>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:electron_tube>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:gears/gold>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:plates/steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:component_iron>))
);



//brass funnel tunnel
recipes.remove(<item:create:brass_funnel>);
recipes.remove(<item:create:brass_tunnel>);

smithing.addRecipe("brass_funnel",<item:create:brass_funnel>,<item:create:andesite_funnel>,<item:create:precision_mechanism>);
smithing.addRecipe("brass_tunnel",<item:create:brass_tunnel>,<item:create:andesite_tunnel>,<item:create:precision_mechanism>);

<recipetype:create:item_application>.addRecipe("brass_tunnel_hand",[<item:create:brass_tunnel>],<item:create:andesite_tunnel>,<item:create:precision_mechanism>,false);
<recipetype:create:item_application>.addRecipe("brass_funnel_hand",[<item:create:brass_funnel>],<item:create:andesite_funnel>,<item:create:precision_mechanism>,false);




//brass casing
<recipetype:create:item_application>.remove(<item:create:brass_casing>);

<recipetype:create:item_application>.addRecipe("brass_casing",[<item:create:brass_casing>],<tag:items:forge:treated_wood>,<item:create:precision_mechanism>,false);


//brass casing machines
<recipetype:create:mechanical_crafting>.remove(<item:createaddition:electric_motor>);
<recipetype:create:mechanical_crafting>.remove(<item:createaddition:alternator>);

craftingTable.addShapeless("motor_to_alternator",<item:createaddition:alternator>,[<item:createaddition:electric_motor>]);
craftingTable.addShapeless("alternator_to_motor",<item:createaddition:electric_motor>,[<item:createaddition:alternator>]);


var c2_1machine = [
	[<item:create:sequenced_gearshift>,<item:minecraft:redstone_torch>],
	[<item:create:stockpile_switch>,<item:minecraft:comparator>],
	[<item:createaddition:modular_accumulator>,<item:createaddition:capacitor>],
	[<item:createaddition:electric_motor>,<item:immersiveengineering:dynamo>],
	[<item:create:smart_chute>,<item:create:chute>],
	[<item:create:content_observer>,<item:minecraft:observer>],
	[<item:create:mechanical_arm>,<item:create:brass_hand>],
	[<item:create:mechanical_crafter>,<item:create:crafting_blueprint>],
	[<item:create:rotation_speed_controller>,<item:create:adjustable_chain_gearshift>],
	[<item:create:clockwork_bearing>,<item:supplementaries:clock_block>],
	[<item:create:elevator_pulley>,<item:supplementaries:pulley_block>],
	[<item:createaddition:portable_energy_interface>,<item:immersiveengineering:coil_hv>],
];

var c2_1core = <item:create:brass_casing>;

for index, element in c2_1machine{
	recipes.remove(element[0]);
	smithing.addRecipe("smithing_c1_2_"+index,element[0],c2_1core,element[1]);
	<recipetype:create:item_application>.addRecipe("hand_c1_2_"+index,[element[0]],c2_1core,element[1],false);
	<recipetype:create:item_application>.addRecipe("return2_c1_2_"+index,[c2_1core,element[1]]
	,element[0],<item:createindustry:screwdriver>.anyDamage(),false);
}

recipes.remove(<item:prettypipes:pipe>);
recipes.remove(<item:prettypipes:blank_module>);

stoneCutter.addRecipe("prettypipes",<item:prettypipes:pipe>*4,c2_1core);
stoneCutter.addRecipe("blank_module",<item:prettypipes:blank_module>*2,c2_1core);

recipes.remove(<item:prettypipes:pressurizer>);
craftingTable.addShaped("pipe_pressurizer",<item:prettypipes:pressurizer>,[
	[<item:prettypipes:high_speed_module>,<item:prettypipes:high_speed_module>,<item:prettypipes:high_speed_module>],
	[<item:prettypipes:high_speed_module>,c2_1core,<item:prettypipes:high_speed_module>],
	[<item:prettypipes:high_speed_module>,<item:prettypipes:high_speed_module>,<item:prettypipes:high_speed_module>]
]);

//destablized_redstone
<recipetype:create:mixing>.addRecipe("destablized_redstone",<constant:create:heat_condition:heated>,[<fluid:thermal:redstone> * 100],[<item:minecraft:redstone>],[],1000);

<recipetype:create:mixing>.addRecipe("destablized_redstone2",<constant:create:heat_condition:heated>,[<fluid:thermal:redstone> * 900],[<item:minecraft:redstone_block>],[],9000);


//copper, gold spool
/*
<recipetype:create:deploying>.addRecipe("empty_spool",<tag:items:forge:plates/iron>,<tag:items:forge:plates/iron>,[<item:createaddition:spool>*16%100],false);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("gold_spool")
	.transitionTo(<item:createaddition:spool>)
	.require(<item:createaddition:spool>)
	.loops(4)
	.addOutput(<item:createaddition:gold_spool> ,1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createaddition:gold_wire>))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("copper_spool")
	.transitionTo(<item:createaddition:spool>)
	.require(<item:createaddition:spool>)
	.loops(4)
	.addOutput(<item:createaddition:copper_spool> ,1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:wires/copper>))
);*/
//sturdy plate
<recipetype:create:sequenced_assembly>.remove(<item:create:sturdy_sheet>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("sturdy_plate")
	.transitionTo(<item:create:unprocessed_obsidian_sheet>)
	.require(<item:create:powdered_obsidian>)
	.loops(10)
	.addOutput(<item:create:sturdy_sheet>,1)
	.addOutput(<item:create:powdered_obsidian>,1)
	.addStep<mods.createtweaker.PressingRecipe>((rb) => rb.duration(140))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("sturdy_plate1")
	.transitionTo(<item:create:unprocessed_obsidian_sheet>)
	.require(<item:create:powdered_obsidian>)
	.loops(10)
	.addOutput(<item:create:sturdy_sheet>,7)
	.addOutput(<item:create:powdered_obsidian>,3)
	.addStep<mods.createtweaker.PressingRecipe>((rb) => rb.duration(140))
	.addStep<mods.createtweaker.FillingRecipe>((a) => a.require(<fluid:minecraft:lava> * 100))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("sturdy_plate2")
	.transitionTo(<item:create:unprocessed_obsidian_sheet>)
	.require(<item:create:powdered_obsidian>)
	.loops(10)
	.addOutput(<item:create:sturdy_sheet>,4)
	.addOutput(<item:create:powdered_obsidian>,1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:cinder_flour>))
	.addStep<mods.createtweaker.PressingRecipe>((rb) => rb.duration(140))
	.addStep<mods.createtweaker.FillingRecipe>((a) => a.require(<fluid:thermal:glowstone> * 100))
);

//integrated_mechanism
<recipetype:create:sequenced_assembly>.remove(<item:create_dd:integrated_mechanism>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("integrated_mechanism")
	.transitionTo(<item:create_dd:incomplete_integrated_mechanism>)
	.require(<item:create:precision_mechanism>)
	.loops(2)
	.addOutput(<item:create_dd:integrated_mechanism>, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:sturdy_sheet>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:electron_tube>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create_dd:integrated_circuit>))
);

<recipetype:create:item_application>.remove(<item:create:railway_casing>);
<recipetype:create:item_application>.addRecipe("train_casing",[<item:create:railway_casing>],<item:create:brass_casing>,<item:create_dd:integrated_mechanism>,false);

//integrated_circuit
<recipetype:create:sequenced_assembly>.remove(<item:create_dd:integrated_circuit>);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("integrated_mechanism2")
	.transitionTo(<item:create_dd:incomplete_integrated_circuit>)
	.require(<item:create_dd:lapis_sheet>)
	.loops(18)
	.addOutput(<item:create_dd:integrated_circuit>, 2)
	.addOutput(<item:create_dd:lapis_sheet>,1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:gold_nugget>))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("integrated_mechanism3")
	.transitionTo(<item:create_dd:incomplete_integrated_circuit>)
	.require(<item:create_dd:lapis_sheet>)
	.loops(18)
	.addOutput(<item:create_dd:integrated_circuit>, 4)
	.addOutput(<item:create_dd:lapis_sheet>,1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:nuggets/electrum>))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("integrated_mechanism4")
	.transitionTo(<item:create_dd:incomplete_integrated_circuit>)
	.require(<item:create_dd:lapis_sheet>)
	.loops(18)
	.addOutput(<item:create_dd:integrated_circuit>, 6)
	.addOutput(<item:create_dd:lapis_sheet>,1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:sturdy_sheet>))
	.addStep<mods.createtweaker.PressingRecipe>((rb) => rb.duration(140))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:nuggets/electrum>))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("integrated_mechanism5")
	.transitionTo(<item:create_dd:incomplete_integrated_circuit>)
	.require(<item:create_dd:lapis_sheet>)
	.loops(18)
	.addOutput(<item:create_dd:integrated_circuit>, 6)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:ae2:nether_quartz_cutting_knife>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:sturdy_sheet>))
	.addStep<mods.createtweaker.PressingRecipe>((rb) => rb.duration(140))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:nuggets/electrum>))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("integrated_mechanism5_1")
	.transitionTo(<item:create_dd:incomplete_integrated_circuit>)
	.require(<item:create_dd:lapis_sheet>)
	.loops(18)
	.addOutput(<item:create_dd:integrated_circuit>, 6)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:ae2:certus_quartz_cutting_knife>.anyDamage()))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:sturdy_sheet>))
	.addStep<mods.createtweaker.PressingRecipe>((rb) => rb.duration(140))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:nuggets/electrum>))
);




<recipetype:create:sequenced_assembly>.remove(<item:balancedflight:flight_anchor>);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("flight_anchor")
	.transitionTo(<item:minecraft:beacon>)
	.require(<item:minecraft:beacon>)
	.loops(3)
	.addOutput(<item:balancedflight:flight_anchor>, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:railway_casing>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create_dd:integrated_mechanism>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:phantom_membrane>))
);

recipes.remove(<item:prettypipes:item_terminal>);
<recipetype:create:mechanical_crafting>.addRecipe("item_terminal", <item:prettypipes:item_terminal>, [
	[<item:create_dd:integrated_mechanism>,<item:create:railway_casing>,<item:create_dd:integrated_mechanism>],
	[<item:create:railway_casing>,<item:create:railway_casing>,<item:create:railway_casing>],
	[<item:create_dd:integrated_mechanism>,<item:create:railway_casing>,<item:create_dd:integrated_mechanism>],
]);


<recipetype:create:mechanical_crafting>.remove(<item:createoreexcavation:drilling_machine>);
<recipetype:create:mechanical_crafting>.addRecipe("drilling_machine",<item:createoreexcavation:drilling_machine>,[
	[<item:create:brass_casing>,<item:create:railway_casing>,<item:create:railway_casing>,<item:create:railway_casing>,<item:create:brass_casing>],
	[<item:create:railway_casing>,<item:create:metal_girder>,<item:immersiveengineering:fluid_pump>,<item:create:metal_girder>,<item:create:railway_casing>],
	[<item:create:railway_casing>,<item:create:railway_casing>,<item:create:mechanical_drill>,<item:create:railway_casing>,<item:create:railway_casing>],
	[<item:create:railway_casing>,<item:create:metal_girder>,<item:create:copper_casing>,<item:create:metal_girder>,<item:create:railway_casing>],
	[<item:create:brass_casing>,<item:create:railway_casing>,<item:create:railway_casing>,<item:create:railway_casing>,<item:create:brass_casing>]
]);

//tier2 base machines
recipes.remove(<item:storagedrawers:controller_slave>);
recipes.remove(<item:immersiveengineering:generator>);
//recipes.remove(<item:create:content_observer>);
recipes.remove(<item:storagedrawers:controller>);
//recipes.remove(<item:create:mechanical_arm>);
//recipes.remove(<item:engineersdecor:small_solar_panel>);
<recipetype:create:mechanical_crafting>.remove(<item:create_sa:brass_drone_item>);
//recipes.remove(<item:createaddition:portable_energy_interface>);


//recipes.remove(<item:create:mechanical_crafter>);
//recipes.remove(<item:create:rotation_speed_controller>);
//recipes.remove(<item:engineersdecor:small_solar_panel>);
//recipes.remove(<item:buzzydrones:idle_station>);
recipes.remove(<item:immersiveengineering:thermoelectric_generator>);
recipes.remove(<item:immersiveengineering:dynamo>);
recipes.remove(<item:immersiveengineering:cloche>);
//recipes.remove(<item:autosmithingtable:auto_smithing_table>);




//stonecutter to make
stoneCutter.addRecipe("controller_slave",<item:storagedrawers:controller_slave>,c2core);
stoneCutter.addRecipe("drawer_controller",<item:storagedrawers:controller>,c2core);
stoneCutter.addRecipe("generator_block",<item:immersiveengineering:generator>,c2core);
//stoneCutter.addRecipe("content_observer",<item:create:content_observer>,c2core);
//stoneCutter.addRecipe("mechanical_arm",<item:create:mechanical_arm>,c2core);
stoneCutter.addRecipe("brass_drone",<item:create_sa:brass_drone_item>,c2core);
//stoneCutter.addRecipe("electric_interface",<item:createaddition:portable_energy_interface>*2,c2core);

//smithing to make

//smithing.addRecipe("mechanical_crafting",<item:create:mechanical_crafter>*5,c2core,<item:create:crafting_blueprint>);
//smithing.addRecipe("speed_controller",<item:create:rotation_speed_controller>,c2core,<item:create:adjustable_chain_gearshift>);
//smithing.addRecipe("solar_panel",<item:engineersdecor:small_solar_panel>,c2core,<item:minecraft:daylight_detector>);
smithing.addRecipe("kinetic_dynamo",<item:immersiveengineering:dynamo>,c2core,<item:immersiveengineering:coil_lv>);
smithing.addRecipe("thermionic_generator",<item:immersiveengineering:thermoelectric_generator>,c2core,<item:immersiveengineering:sheetmetal_constantan>);
//smithing.addRecipe("idle_station",<item:buzzydrones:idle_station>,<item:create:railway_casing>,<item:minecraft:beehive>);
//smithing.addRecipe("electric_motor",<item:createaddition:electric_motor>,c2core,<item:immersiveengineering:dynamo>);
smithing.addRecipe("garden_cloche",<item:immersiveengineering:cloche>,c2core,<item:immersiveengineering:light_bulb>);
//smithing.addRecipe("auto_smithingtable",<item:autosmithingtable:auto_smithing_table>,c2core,<item:minecraft:smithing_table>);


recipes.remove(<item:entangled:block>);
//craftingTable.addShapeless("entangled",<item:entangled:block>,[<item:create:railway_casing>,<item:create_dd:chromatic_block>]);
craftingTable.addShapeless("entangled_reset",<item:entangled:block>,[<item:entangled:block>]);
<recipetype:create:item_application>.addRecipe("entangled",[<item:entangled:block>],<item:create:railway_casing>,<item:create_dd:chromatic_compound>,false);
