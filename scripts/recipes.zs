//misc recipes
//megatorch
recipes.remove(<item:torchmaster:megatorch>);
recipes.remove(<item:torchmaster:feral_flare_lantern>);
recipes.remove(<item:torchmaster:dreadlamp>);

craftingTable.addShaped("megatorch",<item:torchmaster:megatorch>,[[<item:minecraft:sea_lantern>],[<item:thermal:lumium_block>],[<item:create_connected_blocks:gold_block>]]);
craftingTable.addShaped("feral_lantern",<item:torchmaster:feral_flare_lantern>,[[<item:minecraft:obsidian>],[<item:thermal:lumium_block>],[<item:minecraft:obsidian>]]);
craftingTable.addShaped("dreadlamp",<item:torchmaster:dreadlamp>,[[<item:minecraft:obsidian>],[<item:torchmaster:megatorch>],[<item:minecraft:obsidian>]]);