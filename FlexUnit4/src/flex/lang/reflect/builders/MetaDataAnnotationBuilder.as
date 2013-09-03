/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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