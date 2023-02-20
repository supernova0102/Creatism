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
	// Change recipes here
})

ServerEvents.tags('item', event => {
	// Get the #forge:cobblestone tag collection and add Diamond Ore to it
	// event.get('forge:cobblestone').add('minecraft:diamond_ore')

	// Get the #forge:cobblestone tag collection and remove Mossy Cobblestone from it
	// event.get('forge:cobblestone').remove('minecraft:mossy_cobblestone')
})