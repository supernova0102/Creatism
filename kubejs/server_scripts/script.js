// priority: 0

console.info('Hello, World! (You will see this line every time server resources reload)')

ServerEvents.recipes(event => {
	event.recipes.createMechanicalExtruderExtruding(Item.of('minecraft:andesite'),[Fluid.of('minecraft:water'),Fluid.of('minecraft:lava')]).withCatalyst('minecraft:sculk_catalyst')
	event.recipes.createMechanicalExtruderExtruding(Item.of('minecraft:andesite'),[Fluid.of('minecraft:water'),Fluid.of('minecraft:lava')]).withCatalyst('minecraft:sculk')
	event.recipes.createMechanicalExtruderExtruding(Item.of('minecraft:andesite'),[Fluid.of('minecraft:water'),Fluid.of('minecraft:lava')]).withCatalyst('minecraft:budding_amethyst')
	event.recipes.createMechanicalExtruderExtruding(Item.of('minecraft:andesite'),[Fluid.of('minecraft:water'),Fluid.of('minecraft:lava')]).withCatalyst('minecraft:bedrock')

	event.recipes.createMechanicalExtruderExtruding(Item.of('minecraft:dripstone_block'),[Fluid.of('minecraft:water'),Fluid.of('minecraft:lava')]).withCatalyst('minecraft:sculk_catalyst')
	event.recipes.createMechanicalExtruderExtruding(Item.of('minecraft:dripstone_block'),[Fluid.of('minecraft:water'),Fluid.of('minecraft:lava')]).withCatalyst('minecraft:sculk')
	event.recipes.createMechanicalExtruderExtruding(Item.of('minecraft:dripstone_block'),[Fluid.of('minecraft:water'),Fluid.of('minecraft:lava')]).withCatalyst('minecraft:budding_amethyst')
	event.recipes.createMechanicalExtruderExtruding(Item.of('minecraft:dripstone_block'),[Fluid.of('minecraft:water'),Fluid.of('minecraft:lava')]).withCatalyst('minecraft:bedrock')
	
	event.recipes.createoreexcavation.drilling('immersiveengineering:raw_aluminum', '{"text": "Bauxite vein"}', 50, 400).id("my_vein1");
	event.recipes.createoreexcavation.drilling('thermal:raw_silver', '{"text": "Raw Silver vein"}', 20, 400).id("my_vein2");
	event.recipes.createoreexcavation.drilling('thermal:raw_nickel', '{"text": "Raw Nickel vein"}', 30, 400).id("my_vein3");
	event.recipes.createoreexcavation.drilling('thermal:raw_lead', '{"text": "Raw Lead vein"}', 20, 400).id("my_vein4");
	event.recipes.createoreexcavation.drilling('thermal:raw_tin', '{"text": "Raw Tin vein"}', 30, 400).id("my_vein5");

	event.recipes.createoreexcavation.drilling('minecraft:lapis_lazuli', '{"text": "Lapis vein"}', 30, 100).id("my_vein6");
	event.recipes.createoreexcavation.drilling('thermal:cinnabar', '{"text": "Cinnabar vein"}', 10, 100).id("my_vein7");
	event.recipes.createoreexcavation.drilling('thermal:sulfur', '{"text": "Sulfur vein"}', 40, 100).id("my_vein8");
	event.recipes.createoreexcavation.drilling('thermal:niter', '{"text": "Niter vein"}', 50, 100).id("my_vein9");
	// Change recipes here
})

ServerEvents.tags('item', event => {
	// Get the #forge:cobblestone tag collection and add Diamond Ore to it
	// event.get('forge:cobblestone').add('minecraft:diamond_ore')

	// Get the #forge:cobblestone tag collection and remove Mossy Cobblestone from it
	// event.get('forge:cobblestone').remove('minecraft:mossy_cobblestone')
})