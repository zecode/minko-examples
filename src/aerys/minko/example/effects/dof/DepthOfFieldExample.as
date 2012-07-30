package aerys.minko.example.effects.dof
{
	import aerys.minko.render.effect.blur.BlurQuality;
	import aerys.minko.render.effect.dof.DepthOfFieldEffect;
	import aerys.minko.render.geometry.primitive.CubeGeometry;
	import aerys.minko.scene.node.Mesh;
	
	public class DepthOfFieldExample extends MinkoExampleApplication
	{
		override protected function initializeScene():void
		{
			super.initializeScene();
			
			var dof : DepthOfFieldEffect = new DepthOfFieldEffect(BlurQuality.LOW, 8);
			var mat  

			scene.postProcessingEffect = dof;
			cameraController.distanceStep = 0;
			
			for (var i : uint = 0; i < 1000; ++i)
			{
				var cube : Mesh = new Mesh(
					CubeGeometry.cubeGeometry,
					{ diffuseColor : 0xffffffff },
					new Effect(
						Mesh.DEFAULT_EFFECT.getPass(0),
						dof.depthPass
					)
				);
				
				cube.transform.appendTranslation(
					(Math.random() - 0.5) * 100,
					(Math.random() - 0.5) * 100,
					(Math.random() - 0.5) * 100
				);
				
				scene.addChild(cube);
			}
		}
	}
}