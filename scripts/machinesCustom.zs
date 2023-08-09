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


//screw driver
recipes.remove(<item:createindustry:screwdriver>);

craftingTable.addShaped("screwdrive",<item:createindustry:screwdriver>,
[
	[<item:minecraft:dried_kelp>,<item:minecraft:iron_ingot>],
	[<tag:items:forge:dyes/red>,<item:minecraft:dried_kelp>]
]);



//copper_casing_related
//destruction for creation
var transMachines = [<item:create:fluid_pipe>*4,
<item:create:hose_pulley>,
<item:create:fluid_tank>,
<item:create:spout>,
<item:create:portable_fluid_interface>*2,
<item:create_enchantment_industry:printer>,
<item:minecraft:hopper>,
//<item:prettypipes:pipe>*2,
//<item:prettypipes:blank_module>*2,
<item:create_enchantment_industry:disenchanter>,
<item:create:item_drain>];

recipes.remove(<item:create:portable_fluid_interface>);
for index, element in transMachines{
    recipes.remove(element);
	stoneCutter.addRecipe("copper_machines"+ index, element, transCore);
}

//steam_engine
recipes.remove(<item:create:steam_engine>);
smithing.addRecipe("steam_engine",<item:create:steam_engine>,transCore,<item:immersiveengineering:component_iron>);



