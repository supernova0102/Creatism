var c1core = <item:immersiveengineering:light_engineering>;
var baseMachineCore = <item:create:andesite_casing>;


//light_engineering blocck = main of tier1

recipes.remove(c1core);

craftingTable.addShaped("light_engineering_block",c1core,[[<item:immersiveengineering:component_iron>,<item:immersiveengineering:component_iron>,<item:immersiveengineering:component_iron>],[<item:immersiveengineering:component_iron>,baseMachineCore,<item:immersiveengineering:component_iron>],[<item:immersiveengineering:component_iron>,<item:immersiveengineering:component_iron>,<item:immersiveengineering:component_iron>]]);


//component_iron
recipes.remove(<item:immersiveengineering:component_iron>);

craftingTable.addShaped("iron_component_recipe_changed",<item:immersiveengineering:component_iron>,
[[<item:minecraft:air>,<item:create:andesite_alloy>,<item:minecraft:air>],[<item:create:cogwheel>,<item:minecraft:copper_ingot>,<item:create:cogwheel>],[<item:minecraft:air>,<item:minecraft:iron_ingot>,<item:minecraft:air>]]);



<recipetype:create:sequenced_assembly>.addRecipe(
	<recipetype:create:sequenced_assembly>
	.builder("high_efficiency_iron_component_making")
	.transitionTo(<item:create:andesite_alloy>)
	.require(<item:create:andesite_alloy>)
	.loops(1)
	.addOutput(<item:immersiveengineering:component_iron>*2, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:cogwheel>) )

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
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:cogwheel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:andesite_alloy>))
);

//cog wheels
recipes.remove(<item:create:cogwheel>);
recipes.remove(<item:create:large_cogwheel>);

craftingTable.addShaped("cogwheel",<item:create:cogwheel>,
[
	[<tag:items:minecraft:wooden_slabs>,<tag:items:minecraft:wooden_slabs>,<tag:items:minecraft:wooden_slabs>],
	[<tag:items:minecraft:wooden_slabs>,<item:create:shaft>,<tag:items:minecraft:wooden_slabs>],
	[<tag:items:minecraft:wooden_slabs>,<tag:items:minecraft:wooden_slabs>,<tag:items:minecraft:wooden_slabs>]
]);
craftingTable.addShaped("largewheel",<item:create:large_cogwheel>,
[
	[<tag:items:minecraft:planks>,<tag:items:minecraft:planks>,<tag:items:minecraft:planks>],
	[<tag:items:minecraft:planks>,<item:create:shaft>,<tag:items:minecraft:planks>],
	[<tag:items:minecraft:planks>,<tag:items:minecraft:planks>,<tag:items:minecraft:planks>]
]);
craftingTable.addShapeless("cogwheel9",<item:create:cogwheel>*9,[<item:create_compressed:cogwheel_block>]);
craftingTable.addShapeless("largewheel9",<item:create:large_cogwheel>*9,[<item:create_compressed:large_cogwheel_block>]);

<recipetype:create:sequenced_assembly>.addRecipe(
	<recipetype:create:sequenced_assembly>
	.builder("assembly_cogwheel")
	.transitionTo(<item:create:shaft>)
	.require(<item:create:shaft>)
	.loops(4)
	.addOutput(<item:create:cogwheel>*2, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:minecraft:planks>))
);
<recipetype:create:sequenced_assembly>.addRecipe(
	<recipetype:create:sequenced_assembly>
	.builder("assembly_largewheel")
	.transitionTo(<item:create:cogwheel>)
	.require(<item:create:cogwheel>)
	.loops(4)
	.addOutput(<item:create:large_cogwheel>*2, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:minecraft:planks>))
);

//andesite_casing
<recipetype:create:item_application>.remove(baseMachineCore);

<recipetype:create:item_application>.addRecipe("on_hand_casing1_making",[baseMachineCore],<tag:items:forge:stripped_logs>, <item:immersiveengineering:component_iron>, false);
smithing.addRecipe("casing1_smithing",baseMachineCore, <tag:items:forge:stripped_logs>, <item:immersiveengineering:component_iron>);

//andesite_alloy
recipes.remove(<item:create:andesite_alloy>);
<recipetype:create:mixing>.remove(<item:create:andesite_alloy>);


blastFurnace.addRecipe("andesite_alloy_smelting",<item:create:andesite_alloy>,<item:supplementaries:daub>,0.0,100);

//daub, resource for andesite alloy

recipes.remove(<item:supplementaries:daub>);

craftingTable.addShapeless("daub",<item:supplementaries:daub>*2,[<item:exnihilosequentia:porcelain_clay>,<item:minecraft:andesite>,<item:minecraft:andesite>,<item:exnihilosequentia:porcelain_clay>]);
craftingTable.addShapeless("daub2",<item:supplementaries:daub>*2,[<item:exnihilosequentia:porcelain_clay>,<item:minecraft:andesite>,<item:farmersdelight:canvas>,<item:farmersdelight:tree_bark>]);

//grinding to make sand

//washing gravel

/*
<recipetype:create:splashing>.removeByInput(<item:minecraft:gravel>);

<recipetype:create:splashing>.addRecipe("washing_gravel",[
<item:minecraft:flint>%50,
<item:create:copper_nugget>%8, <item:minecraft:iron_nugget>%8, <item:create:zinc_nugget>%8,
<item:minecraft:gold_nugget>%3
],<item:minecraft:gravel>, 100);
*/

//washing dirt
<recipetype:create:splashing>.addRecipe("washing_dirt",[
<item:exnihilosequentia:stone_pebble>%10, <item:exnihilosequentia:granite_pebble>%5,<item:exnihilosequentia:andesite_pebble>%15,<item:exnihilosequentia:calcite_pebble>%5,<item:exnihilosequentia:diorite_pebble>%5,<item:exnihilosequentia:dripstone_pebble>%10,<item:exnihilosequentia:tuff_pebble>%10
],<item:minecraft:dirt>, 100);

<recipetype:create:milling>.addRecipe("milling_sand",[<item:minecraft:sand>*2%100],<item:minecraft:packed_mud>,200);




//drill for mech drill
stoneCutter.remove(<item:createindustry:drill_head>);
craftingTable.addShaped("drill_head",<item:createindustry:drill_head>,[
[<item:create:iron_sheet>,<item:minecraft:air>,<item:minecraft:air>],
[<item:minecraft:air>,<item:minecraft:iron_ingot>,<item:create:andesite_alloy>],
[<item:minecraft:air>,<item:create:andesite_alloy>,<item:create:andesite_alloy>]]);



//press plate for mech press
<recipetype:create:pressing>.remove(<item:createcasing:press_plate>);
craftingTable.addShaped("press_plate",<item:createcasing:press_plate>,
[
	[<tag:items:forge:ingots/lead>,<tag:items:forge:ingots/lead>,<tag:items:forge:ingots/lead>]
]);


//brass hand for deployer
/*
recipes.remove(<item:create:brass_hand>);
craftingTable.addShaped("brass_hand",<item:create:brass_hand>,[
[<item:minecraft:air>,<item:create:copper_sheet>,<item:minecraft:air>],[<item:create:copper_sheet>,<item:create:golden_sheet>,<item:create:copper_sheet>],[<item:create:andesite_alloy>,<item:createaddition:zinc_sheet>,<item:create:andesite_alloy>]]);
*/
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
recipes.remove(<item:create:windmill_bearing>);
recipes.remove(<item:create:gantry_carriage>);


stoneCutter.addRecipe("redstone_contact",<item:create:redstone_contact>*2,c1core);
stoneCutter.addRecipe("mechanical_bearing",<item:create:mechanical_bearing>,c1core);
stoneCutter.addRecipe("rope_polley",<item:create:rope_pulley>,c1core);
stoneCutter.addRecipe("mechanical_piston",<item:create:mechanical_piston>,c1core);
//stoneCutter.addRecipe("mechanical_harvester",<item:create:mechanical_harvester>*2,c1core);
//stoneCutter.addRecipe("mechanical_plough",<item:create:mechanical_plough>*2,c1core);
stoneCutter.addRecipe("portable_storage_interface",<item:create:portable_storage_interface>*2,c1core);
stoneCutter.addRecipe("andesite_funnel",<item:create:andesite_funnel>*2,c1core);
stoneCutter.addRecipe("andesite_tunnel",<item:create:andesite_tunnel>*2,c1core);
stoneCutter.addRecipe("windmill_bearing",<item:create:windmill_bearing>, c1core);
stoneCutter.addRecipe("gantry_gauge",<item:create:gantry_carriage>,c1core);

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


smithing.addRecipe("rolling_mill",<item:createaddition:rolling_mill>,c1core,<item:create:shaft>);
//smithing.addRecipe("encased_fan",<item:create:encased_fan>,c1core,<item:create:propeller>);
//smithing.addRecipe("mechanical_saw",<item:create:mechanical_saw>,c1core,<item:thermal:saw_blade>);
smithing.addRecipe("deployer",<item:create:deployer>,c1core,<item:create:brass_hand>);
smithing.addRecipe("mechanical_extruder",<item:create_mechanical_extruder:mechanical_extruder>,c1core,<item:create_crystal_clear:andesite_glass_casing>);
smithing.addRecipe("mechanical_press",<item:create:mechanical_press>,c1core,<item:createcasing:press_plate>);
smithing.addRecipe("mechanical_mixer",<item:create:mechanical_mixer>,c1core,<item:create:whisk>);
smithing.addRecipe("slicer",<item:sliceanddice:slicer>,c1core,<item:farmersdelight:iron_knife>);
//smithing.addRecipe("mechanical_drill",<item:create:mechanical_drill>,c1core,<item:createindustry:drill_head>);
smithing.addRecipe("sifter",<item:createsifter:sifter>,c1core,<tag:items:exnihilosequentia:sieves>);



//simple machine part
//made by andesite casing
//bertical gear boxs are in encased

//arbnormal_extrator
recipes.remove(<item:thermal:device_tree_extractor>);

smithing.addRecipe("arbreal_extractor",<item:thermal:device_tree_extractor>,baseMachineCore,<item:minecraft:bucket>);

//batch_composter
recipes.remove(<item:thermal:device_composter>);

smithing.addRecipe("batch_composter",<item:thermal:device_composter>,baseMachineCore,<item:minecraft:composter>);

//aquatic_entangler
recipes.remove(<item:thermal:device_fisher>);

smithing.addRecipe("aquatic_entangler",<item:thermal:device_fisher>,baseMachineCore,<item:minecraft:fishing_rod>);

var c1_1machine = [
	[<item:create:mechanical_harvester>,<item:createdeco:zinc_sheet>],
	[<item:create:mechanical_saw>,<item:thermal:saw_blade>],
	[<item:create:mechanical_drill>,<item:createindustry:drill_head>],
	[<item:create:encased_fan>,<item:create:propeller>],
	[<item:create:gearshift>,<item:minecraft:tripwire_hook>],
	[<item:create:clutch>,<item:minecraft:lever>],
	[<item:create:mechanical_plough>,<item:create:iron_sheet>],
	[<item:create:mechanical_roller>,<item:createdeco:andesite_hull>],
	[<item:create:adjustable_chain_gearshift>,<item:create:electron_tube>],
	[<item:create:encased_chain_drive>,<item:minecraft:chain>],
	[<item:create_dd:reversed_gearshift>,<item:minecraft:stone_button>]
];

var c1_1core = <item:create:andesite_casing>;

for index, element in c1_1machine{
	recipes.remove(element[0]);
	smithing.addRecipe("smithing_c1_1_"+index,element[0],c1_1core,element[1]);
	<recipetype:create:item_application>.addRecipe("hand_c1_1_"+index,[element[0]],c1_1core,element[1],false);
	<recipetype:create:item_application>.addRecipe("return2_c1_1_"+index,[c1_1core,element[1]]
	,element[0],<item:createindustry:screwdriver>.anyDamage(),false);
}


//chasis
var chasis1 = <item:create:linear_chassis>;
var chasis2 = <item:create:secondary_linear_chassis>; 

<recipetype:create:item_application>.addRecipe("chasis1",[chasis1],c1_1core,<item:createindustry:screwdriver>.anyDamage(),false);
<recipetype:create:item_application>.addRecipe("chasis2",[chasis2],chasis1,<item:createindustry:screwdriver>.anyDamage(),false);
<recipetype:create:item_application>.addRecipe("chasis3",[c1_1core],chasis2,<item:createindustry:screwdriver>.anyDamage(),false);

//<recipetype:create:item_application>.addRecipe("chasis4",[chasis1],c1_1core,<item:immersiveengineering:screwdriver>,false);
//<recipetype:create:item_application>.addRecipe("chasis5",[chasis2],chasis1,<item:immersiveengineering:screwdriver>,false);
//<recipetype:create:item_application>.addRecipe("chasis6",[c1_1core],chasis2,<item:immersiveengineering:screwdriver>,false);




//copper_casing


<recipetype:create:item_application>.remove(<item:create:copper_casing>);

<recipetype:create:item_application>.addRecipe("copper_casing1",[<item:create:copper_casing>],<item:create:andesite_casing>,<item:create_dd:sealed_mechanism>,false);
smithing.addRecipe("copper_casing",<item:create:copper_casing>,<item:create_dd:sealed_mechanism>,<item:create:andesite_casing>);



craftingTable.addShaped("sealed_mechanism",<item:create_dd:sealed_mechanism>,
[
    [<item:minecraft:air>,<item:minecraft:honeycomb>,<item:minecraft:air>],
    [<item:minecraft:copper_ingot>,c1_1core,<item:minecraft:copper_ingot>],
    [<item:minecraft:air>,<item:thermal:cured_rubber_block>,<item:minecraft:air>]
]);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("sealed_mechanism")
	.transitionTo(<item:create_dd:incomplete_sealed_mechanism>)
	.require(<item:thermal:cured_rubber>)
	.loops(1)
	.addOutput(<item:create_dd:sealed_mechanism>*4, 1)
	.addStep<mods.createtweaker.FillingRecipe>((rb) => rb.require(<fluid:thermal:latex> *125))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:glass/silica>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:copper_ingot>))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("sealed_mechanism2")
	.transitionTo(<item:create_dd:incomplete_sealed_mechanism>)
	.require(<item:thermal:cured_rubber>)
	.loops(1)
	.addOutput(<item:create_dd:sealed_mechanism>*2, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:honeycomb>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:glass/silica>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:copper_ingot>))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("sealed_mechanism3")
	.transitionTo(<item:create_dd:incomplete_sealed_mechanism>)
	.require(<item:minecraft:dried_kelp_block>)
	.loops(1)
	.addOutput(<item:create_dd:sealed_mechanism>*1, 1)
	.addStep<mods.createtweaker.CuttingRecipe>((rb) => rb.duration(50))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:honeycomb>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:glass/silica>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:copper_ingot>))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("sealed_mechanism4")
	.transitionTo(<item:minecraft:dried_kelp_block>)
	.require(<item:minecraft:dried_kelp_block>)
	.loops(1)
	.addOutput(<item:create_dd:sealed_mechanism>*2, 1)
	.addStep<mods.createtweaker.FillingRecipe>((rb) => rb.require(<fluid:thermal:latex> *125))
	.addStep<mods.createtweaker.CuttingRecipe>((rb) => rb.duration(50))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:glass/silica>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:copper_ingot>))
);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("sealed_mechanism5")
	.transitionTo(<item:minecraft:dried_kelp_block>)
	.require(<item:minecraft:dried_kelp_block>)
	.loops(1)
	.addOutput(<item:create_dd:sealed_mechanism>*1, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createindustry:water_insulation>))
	.addStep<mods.createtweaker.CuttingRecipe>((rb) => rb.duration(50))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:glass/silica>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:copper_ingot>))
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("sealed_mechanism6")
	.transitionTo(<item:create_dd:incomplete_sealed_mechanism>)
	.require(<item:thermal:cured_rubber>)
	.loops(1)
	.addOutput(<item:create_dd:sealed_mechanism>*2, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createindustry:water_insulation>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:glass/silica>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:copper_ingot>))
);

//heat engine
//hydraric engine
//in chap3 script