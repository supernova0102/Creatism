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

//andesite_casing
<recipetype:create:item_application>.remove(baseMachineCore);

<recipetype:create:item_application>.addRecipe("on_hand_casing1_making",[baseMachineCore],<tag:items:forge:stripped_logs>, <item:immersiveengineering:component_iron>, false);
smithing.addRecipe("casing1_smithing",baseMachineCore, <tag:items:forge:stripped_logs>, <item:immersiveengineering:component_iron>);

//andesite_alloy
recipes.remove(<item:create:andesite_alloy>);
<recipetype:create:mixing>.remove(<item:create:andesite_alloy>);


craftingTable.addShaped("changed_andesite_alloy", <item:create:andesite_alloy>*2,[[<item:minecraft:andesite>,<item:supplementaries:daub>],[<item:supplementaries:daub>,<item:minecraft:andesite>]]);

<recipetype:create:mixing>.addRecipe("andesite_alloy",<constant:create:heat_condition:none>,[<item:create:andesite_alloy>*2%100],[<item:supplementaries:daub>,<item:minecraft:andesite>],[] as crafttweaker.api.fluid.FluidIngredient[],100);


//daub, resource for andesite alloy

recipes.remove(<item:supplementaries:daub>);

craftingTable.addShapeless("daub",<item:supplementaries:daub>*2,[<item:exnihilosequentia:porcelain_clay>,<item:exnihilosequentia:porcelain_clay>,<item:exnihilosequentia:porcelain_clay>,<item:exnihilosequentia:porcelain_clay>]);
craftingTable.addShapeless("daub2",<item:supplementaries:daub>*4,[<item:exnihilosequentia:porcelain_clay>,<item:exnihilosequentia:porcelain_clay>,<item:farmersdelight:canvas>,<item:farmersdelight:tree_bark>]);


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




//drill for mech drill
stoneCutter.remove(<item:createindustry:drill_head>);
craftingTable.addShaped("drill_head",<item:createindustry:drill_head>,[
[<item:create:iron_sheet>,<item:minecraft:air>,<item:minecraft:air>],
[<item:minecraft:air>,<item:minecraft:iron_ingot>,<item:create:andesite_alloy>],
[<item:minecraft:air>,<item:create:andesite_alloy>,<item:create:andesite_alloy>]]);


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

stoneCutter.addRecipe("redstone_contact",<item:create:redstone_contact>*2,c1core);
stoneCutter.addRecipe("mechanical_bearing",<item:create:mechanical_bearing>,c1core);
stoneCutter.addRecipe("rope_polley",<item:create:rope_pulley>,c1core);
stoneCutter.addRecipe("mechanical_piston",<item:create:mechanical_piston>,c1core);
//stoneCutter.addRecipe("mechanical_harvester",<item:create:mechanical_harvester>*2,c1core);
//stoneCutter.addRecipe("mechanical_plough",<item:create:mechanical_plough>*2,c1core);
stoneCutter.addRecipe("portable_storage_interface",<item:create:portable_storage_interface>*2,c1core);
stoneCutter.addRecipe("andesite_funnel",<item:create:andesite_funnel>*2,c1core);
stoneCutter.addRecipe("andesite_tunnel",<item:create:andesite_tunnel>*2,c1core);

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
smithing.addRecipe("mechanical_press",<item:create:mechanical_press>,c1core,<item:minecraft:anvil>);
smithing.addRecipe("mechanical_mixer",<item:create:mechanical_mixer>,c1core,<item:create:whisk>);
smithing.addRecipe("slicer",<item:sliceanddice:slicer>,c1core,<item:farmersdelight:iron_knife>);
//smithing.addRecipe("mechanical_drill",<item:create:mechanical_drill>,c1core,<item:createindustry:drill_head>);
smithing.addRecipe("sifter",<item:createsifter:sifter>,c1core,<tag:items:exnihilosequentia:sieves>);



//simple machine part
//made by andesite casing

//arbnormal_extrator
recipes.remove(<item:thermal:device_tree_extractor>);

smithing.addRecipe("arbreal_extractor",<item:thermal:device_tree_extractor>,baseMachineCore,<item:minecraft:bucket>);

//batch_composter
recipes.remove(<item:thermal:device_composter>);

smithing.addRecipe("batch_composter",<item:thermal:device_composter>,baseMachineCore,<item:minecraft:composter>);

//aquatic_entangler
recipes.remove(<item:thermal:device_fisher>);

smithing.addRecipe("aquatic_entangler",<item:thermal:device_fisher>,baseMachineCore,<tag:items:forge:fishing_rods>);

var c1_1machine = [
	[<item:create:mechanical_harvester>,<item:createdeco:zinc_sheet>],
	[<item:create:mechanical_saw>,<item:thermal:saw_blade>],
	[<item:create:mechanical_drill>,<item:createindustry:drill_head>],
	[<item:create:gearbox>,<item:create:cogwheel>],
	[<item:create:encased_fan>,<item:create:propeller>],
	[<item:create:gearshift>,<item:minecraft:redstone_torch>],
	[<item:create:clutch>,<item:minecraft:lever>],
	[<item:create:mechanical_plough>,<item:create:iron_sheet>],
	[<item:create:mechanical_roller>,<item:createdeco:andesite_hull>],
	[<item:create:adjustable_chain_gearshift>,<item:create:electron_tube>]
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

craftingTable.addShaped("copper_casing_crafting",<item:create:copper_casing>,
[
    [<item:minecraft:air>,<item:minecraft:dried_kelp_block>,<item:minecraft:air>],
    [<item:minecraft:copper_ingot>,c1_1core,<item:minecraft:copper_ingot>],
    [<item:minecraft:air>,<item:thermal:cured_rubber_block>,<item:minecraft:air>]
]);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("copper_casing")
	.transitionTo(c1_1core)
	.require(baseMachineCore)
	.loops(1)
	.addOutput(<item:create:copper_casing>*2, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:copper_sheet>))
	.addStep<mods.createtweaker.FillingRecipe>((rb) => rb.require(<fluid:thermal:latex> *125))
);

