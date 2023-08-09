var a_casing = <item:create:andesite_casing>;
var a_gearbox = <item:create:gearbox>;
var a_vgearbox = <item:create:vertical_gearbox>;
var a_mixer = <item:create:mechanical_mixer>;
var a_press = <item:create:mechanical_press>;

var c_casing = <item:create:copper_casing>;
var c_gearbox = <item:createcasing:copper_gearbox>;
var c_vgearbox = <item:createcasing:vertical_copper_gearbox>;
var c_mixer = <item:createcasing:copper_mixer>;
var c_press = <item:createcasing:copper_press>;

var b_casing = <item:create:brass_casing>;
var b_gearbox = <item:createcasing:brass_gearbox>;
var b_vgearbox = <item:createcasing:vertical_brass_gearbox>;
var b_mixer = <item:createcasing:brass_mixer>;
var b_press = <item:createcasing:brass_press>;

var t_casing = <item:create:railway_casing>;
var t_gearbox = <item:createcasing:railway_gearbox>;
var t_vgearbox = <item:createcasing:vertical_railway_gearbox>;
var t_mixer = <item:createcasing:railway_mixer>;
var t_press = <item:createcasing:railway_press>;

var screw = <item:createindustry:screwdriver>.anyDamage();

var gearboxes = [
    [a_casing, a_gearbox, a_vgearbox, a_mixer, a_press],
    [c_casing, c_gearbox, c_vgearbox, c_mixer, c_press],
    [b_casing, b_gearbox, b_vgearbox, b_mixer, b_press],
    [t_casing, t_gearbox, t_vgearbox, t_mixer, t_press]
];

//gearbox <-> v_gearbox
/*
for index, element in gearboxes{
    <recipetype:create:item_application>.addRecipe("gear_to_vgear"+index,[element[2]],element[1],screw,false);
    <recipetype:create:item_application>.addRecipe("vgear_to_gear"+index,[element[1]],element[2],screw,false);
}
*/


//transforming gearboxes
for index, element in gearboxes{
    recipes.remove(element[1]);
    <recipetype:create:item_application>.addRecipe("gear_box"+index,[element[1]],element[0],<item:create:andesite_alloy>,false);
    <recipetype:create:item_application>.addRecipe("gear_box_return"+index,[element[0],<item:create:andesite_alloy>],element[1],screw,false);
    smithing.addRecipe("smithing_gear"+index,element[1],element[0],<item:create:andesite_alloy>);
    recipes.remove(element[3]);
    recipes.remove(element[4]);
    for iindex, eelement in gearboxes{
        <recipetype:create:item_application>.addRecipe("gear_to_gear"+index+iindex,[element[1]],eelement[1],element[0],true);
        <recipetype:create:item_application>.addRecipe("vgear_to_vgear"+index+iindex,[element[2]],eelement[2],element[0],true);
        <recipetype:create:item_application>.addRecipe("mixer_to_mixer"+index+iindex,[element[3]],eelement[3],element[0],true);
        <recipetype:create:item_application>.addRecipe("press_to_press"+index+iindex,[element[4]],eelement[4],element[0],true);
    }
}


// steel
// smeltery buff
<recipetype:immersiveengineering:blast_furnace>.remove(<item:immersiveengineering:ingot_steel>);
<recipetype:immersiveengineering:blast_furnace>.addRecipe("buffed_steel",<item:minecraft:iron_ingot>,2000,<item:immersiveengineering:ingot_steel>*2,<item:immersiveengineering:slag>);
<recipetype:immersiveengineering:arc_furnace>.remove(<item:immersiveengineering:ingot_steel>);
<recipetype:immersiveengineering:arc_furnace>.addRecipe("buffed_steel2",<item:minecraft:iron_ingot>,[<tag:items:forge:dusts/coal_coke>*2],200,10000,[<item:immersiveengineering:ingot_steel>*3],<item:thermal:slag_block>);


blastFurnace.addRecipe("steel_blast",<item:immersiveengineering:ingot_steel>,<item:minecraft:iron_ingot>,0.0,100);

<recipetype:create:mixing>.remove(<item:create_dd:steel_ingot>);
<recipetype:create:mixing>.remove(<item:createindustry:steel_ingot>);
<recipetype:create:mixing>.remove(<item:immersiveengineering:ingot_steel>);


craftingTable.addShapeless("steel_to_steel",<item:immersiveengineering:ingot_steel>,[<tag:items:forge:ingots/steel>]);

//steel pipes
recipes.remove(<item:createindustry:steel_pipe>);
recipes.remove(<item:createindustry:steel_pump>);
recipes.remove(<item:create_dd:hydraulic_press>);
recipes.remove(<item:create_dd:bronze_drill>);
recipes.remove(<item:create_dd:bronze_saw>);


<recipetype:create:item_application>.addRecipe("steel_pipe",[<item:createindustry:steel_pipe>],<item:create:fluid_pipe>,<tag:items:forge:ingots/steel>,true);
<recipetype:create:item_application>.addRecipe("steel_pump",[<item:createindustry:steel_pump>],<item:create:mechanical_pump>,<tag:items:forge:ingots/steel>,true);
<recipetype:create:item_application>.addRecipe("copper_pipe",[<item:create:fluid_pipe>],<item:createindustry:steel_pipe>,<item:minecraft:copper_ingot>,true);
<recipetype:create:item_application>.addRecipe("copper_pump",[<item:create:mechanical_pump>],<item:createindustry:steel_pump>,<item:minecraft:copper_ingot>,true);
<recipetype:create:item_application>.addRecipe("copper_drill",[<item:create_dd:bronze_saw>],<item:create:mechanical_drill>,<item:create_sa:hydraulic_engine>,false);
<recipetype:create:item_application>.addRecipe("copper_sawmill",[<item:create_dd:bronze_drill>],<item:create:mechanical_saw>,<item:create_sa:hydraulic_engine>,false);
<recipetype:create:item_application>.addRecipe("copper_press",[<item:create_dd:hydraulic_press>],<item:create:mechanical_press>,<item:create_sa:hydraulic_engine>,false);
<recipetype:create:item_application>.addRecipe("copper_press1",[<item:create_dd:hydraulic_press>],<item:createcasing:railway_press>,<item:create_sa:hydraulic_engine>,false);
<recipetype:create:item_application>.addRecipe("copper_press2",[<item:create_dd:hydraulic_press>],<item:createcasing:copper_press>,<item:create_sa:hydraulic_engine>,false);
<recipetype:create:item_application>.addRecipe("copper_press3",[<item:create_dd:hydraulic_press>],<item:createcasing:brass_press>,<item:create_sa:hydraulic_engine>,false);

//processor
var processor_and_origins = [
    [<item:ae2:printed_calculation_processor>,<item:ae2:charged_certus_quartz_crystal>,<item:ae2:calculation_processor_press>],
    [<item:ae2:printed_engineering_processor>,<item:thermal:enderium_ingot>,<item:ae2:engineering_processor_press>],
    [<item:ae2:printed_logic_processor>,<item:thermal:electrum_plate>,<item:ae2:logic_processor_press>],
    [<item:ae2:printed_silicon>,<item:ae2:silicon>,<item:ae2:silicon_press>]
];
for index, element in processor_and_origins{
    <recipetype:create:deploying>.addRecipe("printed_circuit"+index, element[1], element[2], [element[0] % 100], true);
}


var hammers = [
    <item:exnihilosequentia:copper_hammer>.anyDamage(),
    <item:exnihilosequentia:iron_hammer>.anyDamage(),
    <item:exnihilosequentia:golden_hammer>.anyDamage(),
    <item:exnihilosequentia:diamond_hammer>.anyDamage(),
    <item:exnihilosequentia:netherite_hammer>.anyDamage()
];
var hammer_recipes = [
    [<item:minecraft:stone>,<item:minecraft:cobblestone>],
    [<item:minecraft:cobblestone>,<item:minecraft:gravel>],
    [<item:minecraft:gravel>,<item:minecraft:sand>],
    [<item:minecraft:sand>,<item:exnihilosequentia:dust>],
];

for index, element in hammers{
    for indexm, eelement in hammer_recipes{
        <recipetype:create:deploying>.addRecipe("hammering"+index+indexm, eelement[0], element, [eelement[1] % 100], false);
    }
}

var drawers = [
    [<item:minecraft:oak_planks>,<item:storagedrawers:oak_trim>,<item:storagedrawers:oak_full_drawers_1>,<item:storagedrawers:oak_full_drawers_2>,<item:storagedrawers:oak_full_drawers_4>,<item:storagedrawers:oak_half_drawers_1>*2,<item:storagedrawers:oak_half_drawers_2>*2,<item:storagedrawers:oak_half_drawers_4>*2],
    [<item:minecraft:spruce_planks>,<item:storagedrawers:spruce_trim>,<item:storagedrawers:spruce_full_drawers_1>,<item:storagedrawers:spruce_full_drawers_2>,<item:storagedrawers:spruce_full_drawers_4>,<item:storagedrawers:spruce_half_drawers_1>*2,<item:storagedrawers:spruce_half_drawers_2>*2,<item:storagedrawers:spruce_half_drawers_4>*2],
    [<item:minecraft:birch_planks>,<item:storagedrawers:birch_trim>,<item:storagedrawers:birch_full_drawers_1>,<item:storagedrawers:birch_full_drawers_2>,<item:storagedrawers:birch_full_drawers_4>,<item:storagedrawers:birch_half_drawers_1>*2,<item:storagedrawers:birch_half_drawers_2>*2,<item:storagedrawers:birch_half_drawers_4>*2],
    [<item:minecraft:jungle_planks>,<item:storagedrawers:jungle_trim>,<item:storagedrawers:jungle_full_drawers_1>,<item:storagedrawers:jungle_full_drawers_2>,<item:storagedrawers:jungle_full_drawers_4>,<item:storagedrawers:jungle_half_drawers_1>*2,<item:storagedrawers:jungle_half_drawers_2>*2,<item:storagedrawers:jungle_half_drawers_4>*2],
    [<item:minecraft:acacia_planks>,<item:storagedrawers:acacia_trim>,<item:storagedrawers:acacia_full_drawers_1>,<item:storagedrawers:acacia_full_drawers_2>,<item:storagedrawers:acacia_full_drawers_4>,<item:storagedrawers:acacia_half_drawers_1>*2,<item:storagedrawers:acacia_half_drawers_2>*2,<item:storagedrawers:acacia_half_drawers_4>*2],
    [<item:minecraft:dark_oak_planks>,<item:storagedrawers:dark_oak_trim>,<item:storagedrawers:dark_oak_full_drawers_1>,<item:storagedrawers:dark_oak_full_drawers_2>,<item:storagedrawers:dark_oak_full_drawers_4>,<item:storagedrawers:dark_oak_half_drawers_1>*2,<item:storagedrawers:dark_oak_half_drawers_2>*2,<item:storagedrawers:dark_oak_half_drawers_4>*2],
    [<item:minecraft:crimson_planks>,<item:storagedrawers:crimson_trim>,<item:storagedrawers:crimson_full_drawers_1>,<item:storagedrawers:crimson_full_drawers_2>,<item:storagedrawers:crimson_full_drawers_4>,<item:storagedrawers:crimson_half_drawers_1>*2,<item:storagedrawers:crimson_half_drawers_2>*2,<item:storagedrawers:crimson_half_drawers_4>*2],
    [<item:minecraft:warped_planks>,<item:storagedrawers:warped_trim>,<item:storagedrawers:warped_full_drawers_1>,<item:storagedrawers:warped_full_drawers_2>,<item:storagedrawers:warped_full_drawers_4>,<item:storagedrawers:warped_half_drawers_1>*2,<item:storagedrawers:warped_half_drawers_2>*2,<item:storagedrawers:warped_half_drawers_4>*2],
    [<item:quark:bamboo_planks>,<item:everycomp:sd/quark/bamboo_trim>,<item:everycomp:sd/quark/bamboo_full_drawers_1>,<item:everycomp:sd/quark/bamboo_full_drawers_2>,<item:everycomp:sd/quark/bamboo_full_drawers_4>,<item:everycomp:sd/quark/bamboo_half_drawers_1>*2,<item:everycomp:sd/quark/bamboo_half_drawers_2>*2,<item:everycomp:sd/quark/bamboo_half_drawers_4>*2],
    [<item:create_dd:rose_planks>,<item:everycomp:sd/create_dd/rose_trim>,<item:everycomp:sd/create_dd/rose_full_drawers_1>,<item:everycomp:sd/create_dd/rose_full_drawers_2>,<item:everycomp:sd/create_dd/rose_full_drawers_4>,<item:everycomp:sd/create_dd/rose_half_drawers_1>*2,<item:everycomp:sd/create_dd/rose_half_drawers_2>*2,<item:everycomp:sd/create_dd/rose_half_drawers_4>*2],
    [<item:biomesoplenty:cherry_planks>,<item:everycomp:sd/biomesoplenty/cherry_trim>,<item:everycomp:sd/biomesoplenty/cherry_full_drawers_1>,<item:everycomp:sd/biomesoplenty/cherry_full_drawers_2>,<item:everycomp:sd/biomesoplenty/cherry_full_drawers_4>,<item:everycomp:sd/biomesoplenty/cherry_half_drawers_1>*2,<item:everycomp:sd/biomesoplenty/cherry_half_drawers_2>*2,<item:everycomp:sd/biomesoplenty/cherry_half_drawers_4>*2],
    [<item:biomesoplenty:palm_planks>,<item:everycomp:sd/biomesoplenty/palm_trim>,<item:everycomp:sd/biomesoplenty/palm_full_drawers_1>,<item:everycomp:sd/biomesoplenty/palm_full_drawers_2>,<item:everycomp:sd/biomesoplenty/palm_full_drawers_4>,<item:everycomp:sd/biomesoplenty/palm_half_drawers_1>*2,<item:everycomp:sd/biomesoplenty/palm_half_drawers_2>*2,<item:everycomp:sd/biomesoplenty/palm_half_drawers_4>*2],
    [<item:quark:blossom_planks>,<item:everycomp:sd/quark/blossom_trim>,<item:everycomp:sd/quark/blossom_full_drawers_1>,<item:everycomp:sd/quark/blossom_full_drawers_2>,<item:everycomp:sd/quark/blossom_full_drawers_4>,<item:everycomp:sd/quark/blossom_half_drawers_1>,<item:everycomp:sd/quark/blossom_half_drawers_2>,<item:everycomp:sd/quark/blossom_half_drawers_4>],
    [<item:create_dd:smoked_planks>,<item:everycomp:sd/create_dd/smoked_trim>,<item:everycomp:sd/create_dd/smoked_full_drawers_1>,<item:everycomp:sd/create_dd/smoked_full_drawers_2>,<item:everycomp:sd/create_dd/smoked_full_drawers_4>,<item:everycomp:sd/create_dd/smoked_half_drawers_1>*2,<item:everycomp:sd/create_dd/smoked_half_drawers_2>*2,<item:everycomp:sd/create_dd/smoked_half_drawers_4>*2],
    [<item:biomesoplenty:redwood_planks>,<item:everycomp:sd/biomesoplenty/redwood_trim>,<item:everycomp:sd/biomesoplenty/redwood_full_drawers_1>,<item:everycomp:sd/biomesoplenty/redwood_full_drawers_2>,<item:everycomp:sd/biomesoplenty/redwood_full_drawers_4>,<item:everycomp:sd/biomesoplenty/redwood_half_drawers_1>*2,<item:everycomp:sd/biomesoplenty/redwood_half_drawers_2>*2,<item:everycomp:sd/biomesoplenty/redwood_half_drawers_4>*2],
    [<item:biomesoplenty:jacaranda_planks>,<item:everycomp:sd/biomesoplenty/jacaranda_trim>,<item:everycomp:sd/biomesoplenty/jacaranda_full_drawers_1>,<item:everycomp:sd/biomesoplenty/jacaranda_full_drawers_2>,<item:everycomp:sd/biomesoplenty/jacaranda_full_drawers_4>,<item:everycomp:sd/biomesoplenty/jacaranda_half_drawers_1>*2,<item:everycomp:sd/biomesoplenty/jacaranda_half_drawers_2>*2,<item:everycomp:sd/biomesoplenty/jacaranda_half_drawers_4>*2],
    [<item:quark:ancient_planks>,<item:everycomp:sd/quark/ancient_trim>,<item:everycomp:sd/quark/ancient_full_drawers_1>,<item:everycomp:sd/quark/ancient_full_drawers_2>,<item:everycomp:sd/quark/ancient_full_drawers_4>,<item:everycomp:sd/quark/ancient_half_drawers_1>*2,<item:everycomp:sd/quark/ancient_half_drawers_2>*2,<item:everycomp:sd/quark/ancient_half_drawers_4>*2],
    [<item:create_dd:spirit_planks>,<item:everycomp:sd/create_dd/spirit_trim>,<item:everycomp:sd/create_dd/spirit_full_drawers_1>,<item:everycomp:sd/create_dd/spirit_full_drawers_2>,<item:everycomp:sd/create_dd/spirit_full_drawers_4>,<item:everycomp:sd/create_dd/spirit_half_drawers_1>*2,<item:everycomp:sd/create_dd/spirit_half_drawers_2>*2,<item:everycomp:sd/create_dd/spirit_half_drawers_4>*2],
    [<item:biomesoplenty:willow_planks>,<item:everycomp:sd/biomesoplenty/willow_trim>,<item:everycomp:sd/biomesoplenty/willow_full_drawers_1>,<item:everycomp:sd/biomesoplenty/willow_full_drawers_2>,<item:everycomp:sd/biomesoplenty/willow_full_drawers_4>,<item:everycomp:sd/biomesoplenty/willow_half_drawers_1>*2,<item:everycomp:sd/biomesoplenty/willow_half_drawers_2>*2,<item:everycomp:sd/biomesoplenty/willow_half_drawers_4>*2],
    [<item:biomesoplenty:dead_planks>,<item:everycomp:sd/biomesoplenty/dead_trim>,<item:everycomp:sd/biomesoplenty/dead_full_drawers_1>,<item:everycomp:sd/biomesoplenty/dead_full_drawers_2>,<item:everycomp:sd/biomesoplenty/dead_full_drawers_4>,<item:everycomp:sd/biomesoplenty/dead_half_drawers_1>*2,<item:everycomp:sd/biomesoplenty/dead_half_drawers_2>*2,<item:everycomp:sd/biomesoplenty/dead_half_drawers_4>*2],
    [<item:quark:azalea_planks>,<item:everycomp:sd/quark/azalea_trim>,<item:everycomp:sd/quark/azalea_full_drawers_1>,<item:everycomp:sd/quark/azalea_full_drawers_2>,<item:everycomp:sd/quark/azalea_full_drawers_4>,<item:everycomp:sd/quark/azalea_half_drawers_1>*2,<item:everycomp:sd/quark/azalea_half_drawers_2>*2,<item:everycomp:sd/quark/azalea_half_drawers_4>*2],
    [<item:biomesoplenty:hellbark_planks>,<item:everycomp:sd/biomesoplenty/hellbark_trim>,<item:everycomp:sd/biomesoplenty/hellbark_full_drawers_1>,<item:everycomp:sd/biomesoplenty/hellbark_full_drawers_2>,<item:everycomp:sd/biomesoplenty/hellbark_full_drawers_4>,<item:everycomp:sd/biomesoplenty/hellbark_half_drawers_1>*2,<item:everycomp:sd/biomesoplenty/hellbark_half_drawers_2>*2,<item:everycomp:sd/biomesoplenty/hellbark_half_drawers_4>*2],
    [<item:biomesoplenty:umbran_planks>,<item:everycomp:sd/biomesoplenty/umbran_trim>,<item:everycomp:sd/biomesoplenty/umbran_full_drawers_1>,<item:everycomp:sd/biomesoplenty/umbran_full_drawers_2>,<item:everycomp:sd/biomesoplenty/umbran_full_drawers_4>,<item:everycomp:sd/biomesoplenty/umbran_half_drawers_1>*2,<item:everycomp:sd/biomesoplenty/umbran_half_drawers_2>*2,<item:everycomp:sd/biomesoplenty/umbran_half_drawers_4>*2],
    [<item:biomesoplenty:fir_planks>,<item:everycomp:sd/biomesoplenty/fir_trim>,<item:everycomp:sd/biomesoplenty/fir_full_drawers_1>,<item:everycomp:sd/biomesoplenty/fir_full_drawers_2>,<item:everycomp:sd/biomesoplenty/fir_full_drawers_4>,<item:everycomp:sd/biomesoplenty/fir_half_drawers_1>*2,<item:everycomp:sd/biomesoplenty/fir_half_drawers_2>*2,<item:everycomp:sd/biomesoplenty/fir_half_drawers_4>*2],
    [<item:biomesoplenty:mahogany_planks>,<item:everycomp:sd/biomesoplenty/mahogany_trim>,<item:everycomp:sd/biomesoplenty/mahogany_full_drawers_1>,<item:everycomp:sd/biomesoplenty/mahogany_full_drawers_2>,<item:everycomp:sd/biomesoplenty/mahogany_full_drawers_4>,<item:everycomp:sd/biomesoplenty/mahogany_half_drawers_1>*2,<item:everycomp:sd/biomesoplenty/mahogany_half_drawers_2>*2,<item:everycomp:sd/biomesoplenty/mahogany_half_drawers_4>*2],
    [<item:biomesoplenty:magic_planks>,<item:everycomp:sd/biomesoplenty/magic_trim>,<item:everycomp:sd/biomesoplenty/magic_full_drawers_1>,<item:everycomp:sd/biomesoplenty/magic_full_drawers_2>,<item:everycomp:sd/biomesoplenty/magic_full_drawers_4>,<item:everycomp:sd/biomesoplenty/magic_half_drawers_1>*2,<item:everycomp:sd/biomesoplenty/magic_half_drawers_2>*2,<item:everycomp:sd/biomesoplenty/magic_half_drawers_4>*2]
];


for index, element in drawers{
    recipes.remove(element[1]);recipes.remove(element[2]);recipes.remove(element[3]);recipes.remove(element[4]);recipes.remove(element[5]);recipes.remove(element[6]);recipes.remove(element[7]);
    smithing.addRecipe("smithing_trim"+index,element[1],<item:create:andesite_alloy>,element[0]);
	<recipetype:create:item_application>.addRecipe("hand_trim"+index,[element[1]],element[0],<item:create:andesite_alloy>,false);
    stoneCutter.addRecipe("cutting"+index+"1",element[2],element[1]);
    stoneCutter.addRecipe("cutting"+index+"2",element[3],element[1]);
    stoneCutter.addRecipe("cutting"+index+"3",element[4],element[1]);
    stoneCutter.addRecipe("cutting"+index+"4",element[5],element[1]);
    stoneCutter.addRecipe("cutting"+index+"5",element[6],element[1]);
    stoneCutter.addRecipe("cutting"+index+"6",element[7],element[1]);
}

//ore processing

var ores = [
    <item:minecraft:raw_iron>,
    <item:minecraft:raw_copper>,
    <item:minecraft:raw_gold>,
    <item:create_dd:raw_tin>,
    <item:thermal:raw_tin>,
    <item:thermal:raw_lead>,
    <item:thermal:raw_silver>,
    <item:thermal:raw_nickel>,
    <item:immersiveengineering:raw_aluminum>,
    <item:immersiveengineering:raw_lead>,
    <item:immersiveengineering:raw_silver>,
    <item:immersiveengineering:raw_nickel>,
    <item:immersiveengineering:raw_uranium>,
    <item:create:raw_zinc>
];