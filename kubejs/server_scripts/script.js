// priority: 0

console.info('Hello, World! (You will see this line every time server resources reload)')


//전역변수 선언
var custom_gen_stones = 
		['minecraft:granite','minecraft:diorite','minecraft:andesite','minecraft:andesite','create:asurine','create:crimsite','create:ochrum','create:veridium','minecraft:calcite','minecraft:tuff'];
var c1core = "immersiveengineering:light_engineering";
var baseMachineCore = "create:andesite_casing";
var c2core = "immersiveengineering:heavy_engineering";
var c3core = "thermal:machine_frame";
var c4Core = "compressedcreativity:compressed_iron_casing";
var transCore = "create:copper_casing";



ServerEvents.entityLootTables(event => {
	event.modifyEntity("minecraft:cow", table => {
		table.addPool(pool => {
			pool.addItem("minecraft:bone")
		})
	})
	event.modifyEntity("minecraft:pig", table => {
		table.addPool(pool => {
			pool.addItem("minecraft:bone")
		})
	})
	event.modifyEntity("minecraft:sheep", table => {
		table.addPool(pool => {
			pool.addItem("minecraft:bone")
		})
	})
})

ServerEvents.recipes(event => {
	//레시피변경
	c1Recipes();

	event.recipes.createoreexcavation.drilling('immersiveengineering:raw_aluminum', '{"text": "Bauxite vein"}', 50, 400).id("my_vein1");
	event.recipes.createoreexcavation.drilling('thermal:raw_silver', '{"text": "Raw Silver vein"}', 20, 400).id("my_vein2");
	event.recipes.createoreexcavation.drilling('thermal:raw_nickel', '{"text": "Raw Nickel vein"}', 30, 400).id("my_vein3");
	event.recipes.createoreexcavation.drilling('thermal:raw_lead', '{"text": "Raw Lead vein"}', 20, 400).id("my_vein4");
	event.recipes.createoreexcavation.drilling('thermal:raw_tin', '{"text": "Raw Tin vein"}', 30, 400).id("my_vein5");

	event.recipes.createoreexcavation.drilling('minecraft:lapis_lazuli', '{"text": "Lapis vein"}', 30, 100).id("my_vein6");
	event.recipes.createoreexcavation.drilling('thermal:cinnabar', '{"text": "Cinnabar vein"}', 10, 100).id("my_vein7");
	event.recipes.createoreexcavation.drilling('thermal:sulfur', '{"text": "Sulfur vein"}', 40, 100).id("my_vein8");
	event.recipes.createoreexcavation.drilling('thermal:niter', '{"text": "Niter vein"}', 50, 100).id("my_vein9");
	

	//커스텀 레시피함수
	function custom_rockgen(output, catalyst){
		event.custom({
			"type" : "thermal:rock_gen",
			"abjacent" : 'minecraft:ice',
			"below" : catalyst,
			"result" : { "item" : output}
		});
		event.recipes.createMechanicalExtruderExtruding(Item.of(output),[Fluid.of('minecraft:water'),Fluid.of('minecraft:lava')])
		.withCatalyst(catalyst);
	}

	//레시피 등록 파편화
	function c1Recipes(){
		for(let item of custom_gen_stones){
			custom_rockgen(item, 'minecraft:sculk');
			custom_rockgen(item, 'minecraft:sculk_catalyst');
			custom_rockgen(item, 'minecraft:bedrock');
		}

		
	}

})

ServerEvents.tags('item', event => {
	

	// Get the #forge:cobblestone tag collection and add Diamond Ore to it
	// event.get('forge:cobblestone').add('minecraft:diamond_ore')

	// Get the #forge:cobblestone tag collection and remove Mossy Cobblestone from it
	// event.get('forge:cobblestone').remove('minecraft:mossy_cobblestone')
})

//레시피 변경 파편화
