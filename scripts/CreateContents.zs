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
recipes.remove(<item:immersiveengineering:component_iron>);
recipes.remove(<item:immersiveengineering:component_steel>);

<recipetype:create:deploying>.remove(<item:create:andesite_casing>);
<recipetype:create:item_application>.remove(<item:create:andesite_casing>);

<recipetype:create:item_application>.remove(<item:create:brass_casing>);

<recipetype:create:item_application>.remove(<item:create:copper_casing>);

<recipetype:create:sequenced_assembly>.remove(<item:create:precision_mechanism>);




//component_iron
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



//component_steel
craftingTable.addShaped("iron_to_steel_component",<item:immersiveengineering:component_steel>*2,
[[<item:minecraft:air>,<item:create:andesite_alloy>,<item:minecraft:air>],[<item:minecraft:air>,<item:immersiveengineering:component_iron>,<item:minecraft:air>],[<item:minecraft:air>,<tag:items:forge:ingots/steel>,<item:minecraft:air>]]);

craftingTable.addShaped("only_making_steel_component",<item:immersiveengineering:component_steel>,
[[<item:minecraft:air>,<item:create:andesite_alloy>,<item:minecraft:air>],[<tag:items:forge:cogwheels>,<tag:items:forge:ingots/steel>,<tag:items:forge:cogwheels>],[<item:minecraft:air>,<item:create:andesite_alloy>,<item:minecraft:air>]]);



<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("high_efficiency_steel_component_making1")
	.transitionTo(<item:create_connected_blocks:incomplete_iron_reinforcement>)
	.require(<item:alloyed:steel_sheet>)
	.loops(2)
	.addOutput(<item:immersiveengineering:component_steel> * 6,1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:andesite_alloy>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:component_iron>))	
);
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("high_efficiency_steel_component_making2")
	.transitionTo(<item:create_connected_blocks:incomplete_iron_reinforcement>)
	.require(<item:alloyed:steel_sheet>)
	.loops(2)
	.addOutput(<item:immersiveengineering:component_steel> * 2,1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:andesite_alloy>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:cogwheels>))

);


//andesite_casing

<recipetype:create:item_application>.addRecipe("on_hand_casing1_making",[<item:create:andesite_casing>],<tag:items:forge:stripped_logs>, <item:immersiveengineering:component_iron>, true);

//brass_casing

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("brass_casing")
	.transitionTo(<item:create:andesite_casing>)
	.require(<item:create:andesite_casing>)
	.loops(1)
	.addOutput(<item:create:brass_casing>*2, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:component_steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:treated_wood>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:brass_sheet>))
);

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

//precision_mechanism

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("precision_mechanism")
	.transitionTo(<item:create:golden_sheet>)
	.require(<item:create:golden_sheet>)
	.loops(3)
	.addOutput(<item:create:precision_mechanism>*2, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:component_steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:createaddition:gold_wire>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:component_steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:extendedgears:copper_cogwheel>))
);