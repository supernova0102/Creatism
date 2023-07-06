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