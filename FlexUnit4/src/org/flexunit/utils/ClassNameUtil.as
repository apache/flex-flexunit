package org.flexunit.utils {
	/**
	 * The <code>ClassNameUtil</code> is responsible for assisting in the formatting of class names.
	 */
	public class ClassNameUtil {
		import flash.utils.getQualifiedClassName;

		/**
		 * Returns a logger friendly class name for the provided instance or class.  The
		 * normal qualified class name will have all "::", "." and "$" replaced with underscores.
		 * 
		 * @param instance or class The Object for which to obtain a logger friendly class name.
		 * 
		 * @return an escaped path that the Logger class can parse
		 */
		public static function getLoggerFriendlyClassName( instanceOrClass:Object ):String {
			var periodReplace:RegExp = /\./g;
			var colonReplace:RegExp = /::/g;
			var dollarSignReplace:RegExp = /\$/g;

			var escapedName:String = getQualifiedClassName( instanceOrClass );
			escapedName = escapedName.replace( periodReplace, "_" );
			escapedName = escapedName.replace( colonReplace, "_" );
			escapedName = escapedName.replace( dollarSignReplace, "_" );

			return escapedName;
		}
		
		/**
		 * Constructor.
		 */
		public function ClassNameUtil() {
		}
	}
}