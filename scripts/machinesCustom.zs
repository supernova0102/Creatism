//var def

var c1core = <item:immersiveengineering:light_engineering>;
var baseMachineCore = <item:create:andesite_casing>;
var rubber = <item:thermal:cured_rubber>;
var transCore = <item:create:copper_casing>;


//belt and rubber


craftingTable.addShaped("rubber_belt",<item:create:belt_connector>*2,
[[rubber,rubber,rubber],[rubber,rubber,rubber]]);

<recipetype:create:compacting>.addRecipe("resin_to_latex",<constant:create:heat_condition:none>,[<fluid:thermal:latex> * 250],[],[<fluid:thermal:resin> * 500], 20);
<recipetype:create:compacting>.addRecipe("latex_to_rubber",<constant:create:heat_condition:none>,[<item:thermal:rubber>%100],[],[<fluid:thermal:latex> * 250],40);

//arbnormal_extrator
recipes.remove(<item:thermal:device_tree_extractor>);

smithing.addRecipe("arbreal_extractor",<item:thermal:device_tree_extractor>,baseMachineCore,<item:minecraft:bucket>);

//batch_composter
recipes.remove(<item:thermal:device_composter>);

smithing.addRecipe("batch_composter",<item:thermal:device_composter>,baseMachineCore,<item:minecraft:composter>);

//aquatic_entangler
recipes.remove(<item:thermal:device_fisher>);

smithing.addRecipe("aquatic_entangler",<item:thermal:device_fisher>,baseMachineCore,<tag:items:forge:fishing_rods>);



//copper_casing_related
//destruction for creation
var transMachines = [<item:create:fluid_pipe>*4,
<item:create:hose_pulley>,
<item:create:fluid_tank>,
<item:create:spout>,
<item:create:portable_fluid_interface>*2,
<item:create_enchantment_industry:printer>,
<item:minecraft:hopper>,
<item:uppers:upper>,
<item:prettypipes:pipe>*2,
<item:prettypipes:blank_module>*2,
<item:create_enchantment_industry:disenchanter>,
<item:create:item_drain>];

recipes.remove(<item:prettypipes:blank_module>);
for index, element in transMachines{
    recipes.remove(element);
	stoneCutter.addRecipe("copper_machines"+ index, element, transCore);
}

//steam_engine
recipes.remove(<item:create:steam_engine>);
smithing.addRecipe("steam_engine",<item:create:steam_engine>,transCore,<item:immersiveengineering:component_iron>);


//copper_casing


<recipetype:create:item_application>.remove(<item:create:copper_casing>);

craftingTable.addShaped("copper_casing_crafting",transCore,
[
    [<item:minecraft:air>,<item:minecraft:dried_kelp_block>,<item:minecraft:air>],
    [<item:minecraft:copper_ingot>,baseMachineCore,<item:minecraft:copper_ingot>],
    [<item:minecraft:air>,<item:thermal:cured_rubber_block>,<item:minecraft:air>]
]);

<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("copper_casing")
	.transitionTo(baseMachineCore)
	.require(baseMachineCore)
	.loops(1)
	.addOutput(<item:create:copper_casing>*2, 1)
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:dried_kelp>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:minecraft:copper_ingot>))
	.addStep<mods.createtweaker.DeployerApplicationRecipe>((rb) => rb.require(<item:thermal:cured_rubber>))
);


