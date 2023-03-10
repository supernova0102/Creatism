import mods.create.DeployerApplicationManager;
import mods.create.ItemApplicationManager;
import mods.createtweaker.SequencedAssemblyRecipeBuilder;
//null == <item:minecraft:air>

//시퀸스드 어셈블리 예제
/*
<recipetype:create:sequenced_assembly>.addRecipe(<recipetype:create:sequenced_assembly>.builder("seq_blast_brick")
 .transitionTo(<item:create:large_cogwheel>)
 .require(<item:create:andesite_alloy>)
 .loops(3)
 .addOutput(<item:create:large_cogwheel> * 6, 32)
 .addOutput(<item:create:andesite_alloy>, 2)
 .addOutput(<item:minecraft:andesite>, 1)
 .addOutput(<item:create:cogwheel>, 1)
 .addOutput(<item:minecraft:stick>, 1)
 .addOutput(<item:minecraft:iron_nugget>, 1)
 .addStep<mods.createtweaker.DeployerApplicationRecipe>((a) => a.require(<tag:items:minecraft:planks>))
 .addStep<mods.createtweaker.DeployerApplicationRecipe>((a) => a.require(<tag:items:minecraft:wooden_buttons>))
 .addStep<mods.createtweaker.CuttingRecipe>((a) => a.duration(50))
 .addStep<mods.createtweaker.FillingRecipe>((a) => a.require(<fluid:minecraft:water> * 50)));*/
//궁금할때 주석 풀어서 직접 보


//removals




