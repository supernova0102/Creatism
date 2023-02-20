import mods.create.DeployerApplicationManager;
import mods.create.ItemApplicationManager;
import mods.createtweaker.SequencedAssemblyRecipeBuilder;
//null == <item:minecraft:air>

//시퀸스드 어셈블리 예제
/*
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("seq_blast_brick")
 .transitionTo(<item:create:large_cogwheel>)
 .require(<item:create:andesite_alloy>)
 .loops(3)
 .addOutput(<item:create:large_cogwheel> * 6, 32)
 .addOutput(<item:create:andesite_alloy>, 2)
 .addOutput(<item:minecraft:andesite>, 1)
 .addOutput(<item:create:cogwheel>, 1)
 .addOutput(<item:minecraft:stick>, 1)
 .addOutput(<item:minecraft:iron_nugget>, 1)
 .addStep<mods.createtweaker.DeployerApplicationRecipe>((a) => a.require(<tag:items:minecraft:planks>))
 .addStep<mods.createtweaker.DeployerApplicationRecipe>((a) => a.require(<tag:items:minecraft:wooden_buttons>))
 .addStep<mods.createtweaker.CuttingRecipe>((a) => a.duration(50))
 .addStep<mods.createtweaker.FillingRecipe>((a) => a.require(<fluid:minecraft:water> * 50)));*/
//궁금할때 주석 풀어서 직접 보


//removals





<recipetype:create:item_application>.remove(<item:create:copper_casing>);



//copper_casing

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("copper_casing")
	.transitionTo(<item:create:andesite_casing>)
	.require(<item:create:andesite_casing>)
	.loops(1)
	.addOutput(<item:create:copper_casing>*2, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:dried_kelp>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:copper_ingot>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:dried_kelp>))
);



//drill for mech drill
stoneCutter.remove(<item:createindustry:drill_head>);
craftingTable.addShaped("drill_head",<item:createindustry:drill_head>,[
[<item:minecraft:diamond>,<item:minecraft:air>,<item:minecraft:air>],
[<item:minecraft:air>,<item:createbigcannons:cast_iron_block>,<item:create:andesite_alloy>],
[<item:minecraft:air>,<item:create:andesite_alloy>,<item:create:andesite_alloy>]]);


//brass hand for deployer
recipes.remove(<item:create:brass_hand>);
craftingTable.addShaped("brass_hand",<item:create:brass_hand>,[
[<item:minecraft:air>,<item:create:copper_sheet>,<item:minecraft:air>],[<item:create:copper_sheet>,<item:create:copper_sheet>,<item:create:copper_sheet>],[<item:create:andesite_alloy>,<item:createaddition:zinc_sheet>,<item:create:andesite_alloy>]]);

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

stoneCutter.addRecipe("redstone_contact",<item:create:redstone_contact>*2,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("mechanical_bearing",<item:create:mechanical_bearing>,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("rope_polley",<item:create:rope_pulley>,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("mechanical_piston",<item:create:mechanical_piston>,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("mechanical_harvester",<item:create:mechanical_harvester>*2,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("mechanical_plough",<item:create:mechanical_plough>*2,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("portable_storage_interface",<item:create:portable_storage_interface>*2,<item:immersiveengineering:light_engineering>);
stoneCutter.addRecipe("andesite_funnel",<item:create:andesite_funnel>*2,<item:immersiveengineering:light_engineering>);

//smithing to make
recipes.remove(<item:createaddition:rolling_mill>);
recipes.remove(<item:create:encased_fan>);
recipes.remove(<item:create:mechanical_saw>);
recipes.remove(<item:create:deployer>);
recipes.remove(<item:create_mechanical_extruder:mechanical_extruder>);
recipes.remove(<item:create:mechanical_press>);
recipes.remove(<item:create:mechanical_mixer>);
recipes.remove(<item:sliceanddice:slicer>);

smithing.addRecipe("rolling_mill",<item:createaddition:rolling_mill>,<item:immersiveengineering:light_engineering>,<item:create:shaft>);
smithing.addRecipe("encased_fan",<item:create:encased_fan>,<item:immersiveengineering:light_engineering>,<item:create:propeller>);
smithing.addRecipe("mechanical_saw",<item:create:mechanical_saw>,<item:immersiveengineering:light_engineering>,<item:minecraft:iron_axe>);
smithing.addRecipe("deployer",<item:create:deployer>,<item:immersiveengineering:light_engineering>,<item:create:brass_hand>);
smithing.addRecipe("mechanical_extruder",<item:create_mechanical_extruder:mechanical_extruder>,<item:immersiveengineering:light_engineering>,<item:create_crystal_clear:andesite_glass_casing>);
smithing.addRecipe("mechanical_press",<item:create:mechanical_press>,<item:immersiveengineering:light_engineering>,<item:minecraft:anvil>);
smithing.addRecipe("mechanical_mixer",<item:create:mechanical_mixer>,<item:immersiveengineering:light_engineering>,<item:create:whisk>);
smithing.addRecipe("slicer",<item:sliceanddice:slicer>,<item:immersiveengineering:light_engineering>,<item:farmersdelight:iron_knife>);
smithing.addRecipe("mechanical_drill",<item:create:mechanical_drill>,<item:immersiveengineering:light_engineering>,<item:createindustry:drill_head>);


