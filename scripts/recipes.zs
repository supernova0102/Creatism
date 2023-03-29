//misc recipes
//megatorch
recipes.remove(<item:torchmaster:megatorch>);
recipes.remove(<item:torchmaster:feral_flare_lantern>);
recipes.remove(<item:torchmaster:dreadlamp>);

craftingTable.addShaped("megatorch",<item:torchmaster:megatorch>,[[<item:minecraft:sea_lantern>],[<item:thermal:lumium_block>],[<item:create_connected_blocks:gold_block>]]);
craftingTable.addShaped("feral_lantern",<item:torchmaster:feral_flare_lantern>,[[<item:minecraft:obsidian>],[<item:thermal:lumium_block>],[<item:minecraft:obsidian>]]);
craftingTable.addShaped("dreadlamp",<item:torchmaster:dreadlamp>,[[<item:minecraft:obsidian>],[<item:torchmaster:megatorch>],[<item:minecraft:obsidian>]]);

//legacy_fence

craftingTable.addShaped("leagacy_fence",<item:minecraft:oak_fence> * 2,[[<tag:items:forge:rods/wooden>,<tag:items:forge:rods/wooden>,<tag:items:forge:rods/wooden>],[<tag:items:forge:rods/wooden>,<tag:items:forge:rods/wooden>,<tag:items:forge:rods/wooden>]]);

//stick_scarfold

craftingTable.addShaped("stick_scarfold",<item:minecraft:scaffolding>*2,[[<item:minecraft:stick>,<item:farmersdelight:canvas>,<item:minecraft:stick>],[<item:minecraft:stick>,<item:minecraft:air>,<item:minecraft:stick>],[<item:minecraft:stick>,<item:minecraft:air>,<item:minecraft:stick>]]);

//string_mesh
recipes.remove(<item:createsifter:string_mesh>);

craftingTable.addShaped("string_mesh",<item:createsifter:string_mesh>,[[<tag:items:forge:rods>,<tag:items:forge:rods>,<tag:items:forge:rods>],[<tag:items:forge:rods>,<item:exnihilosequentia:string_mesh>,<tag:items:forge:rods>],[<tag:items:forge:rods>,<tag:items:forge:rods>,<tag:items:forge:rods>]]);


//no recipe for time in a bottle
recipes.remove(<item:tiab:time_in_a_bottle>);