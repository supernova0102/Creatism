//heavy_engineering block = main tier 2 block
recipes.remove(<item:immersiveengineering:heavy_engineering>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("heavy_engineering_block")
 	.transitionTo(<item:create:brass_casing>)
 	.require(<item:create:brass_casing>)
 	.loops(3)

 	.addOutput(<item:immersiveengineering:heavy_engineering>, 1)
 	.addStep<mods.createtweaker.CuttingRecipe>((a) => a.duration(50))
 	.addStep<mods.createtweaker.FillingRecipe>((a) => a.require(<fluid:createbigcannons:molten_cast_iron> * 90))
 	.addStep<mods.createtweaker.FillingRecipe>((a) => a.require(<fluid:create_things_and_misc:slime> * 300))
 	.addStep<mods.createtweaker.DeployerApplicationRecipe>((a) => a.require(<item:create:precision_mechanism>))
 	);



//component_steel
recipes.remove(<item:immersiveengineering:component_steel>);


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



//brass_casing
<recipetype:create:item_application>.remove(<item:create:brass_casing>);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("brass_casing")
	.transitionTo(<item:create:andesite_casing>)
	.require(<item:create:andesite_casing>)
	.loops(1)
	.addOutput(<item:create:brass_casing>*2, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:immersiveengineering:component_steel>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<tag:items:forge:treated_wood>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:create:brass_sheet>))
);


//precision_mechanism
<recipetype:create:sequenced_assembly>.remove(<item:create:precision_mechanism>);


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