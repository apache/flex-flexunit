package net.digitalprimates.event
{
	import flash.events.Event;

	public class PrimeGeneratorEvent extends Event
	{
		public static const GENERATOR_READY:String = "primeGeneratorReady";
		public static const GENERATION_COMPLETE:String = "primeGenerationComplete";
		
		public var primeList:Array;
		
		public function PrimeGeneratorEvent( type:String, primeList:Array )
		{
			super( type, false, false );
			
			this.primeList = primeList;
		}
	}
}