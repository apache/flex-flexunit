package flex.lang.reflect.builders {
	import flex.lang.reflect.metadata.MetaDataAnnotation;
	import flex.lang.reflect.utils.MetadataTools;

	public class MetaDataAnnotationBuilder {
		/**
		 * @private
		 */
		private var classXML:XML;
		
		/**
		 * Builds an array of annotation contained on the provided class xml 
		 * @return 
		 * 
		 */		
		public function buildAllAnnotations():Array {
			var metaDataAr:Array = new Array();
			var metaDataList:XMLList;			
			
			if ( classXML.factory && classXML.factory[ 0 ] ) {
				metaDataList = MetadataTools.nodeMetaData( classXML.factory[ 0 ] );
				if ( metaDataList ) {
					for ( var i:int=0; i<metaDataList.length(); i++ ) {
						metaDataAr.push( new MetaDataAnnotation( metaDataList[ i ] ) );
					}
				}
			}			
			
			return metaDataAr;			
		}

		/**
		 * 
		 * @param classXML
		 * 
		 */		
		public function MetaDataAnnotationBuilder( classXML:XML ) {
			this.classXML = classXML;
		}
	}
}