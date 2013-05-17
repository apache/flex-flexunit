package tests.flex.lang.reflect.constructor.helper {
	import flex.lang.reflect.Klass;

	public class StubKlass extends Klass {

		/**
		 * @private
		 */
		private var _classDef:Class;
		
		/**
		 * Returns the <code>Class</code> definition
		 */
		override public function get classDef():Class {
			return _classDef;
		}
		
		public function StubKlass( classDef:Class ) {
			_classDef = classDef;
			
			super( null );
		}
	}
}