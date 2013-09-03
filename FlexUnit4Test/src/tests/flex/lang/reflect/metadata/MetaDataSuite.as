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
package tests.flex.lang.reflect.metadata {
	import tests.flex.lang.reflect.metadata.metaDataAnnotation.AnnotationWithInvalidData;
	import tests.flex.lang.reflect.metadata.metaDataAnnotation.AnnotationWithValidData;
	import tests.flex.lang.reflect.metadata.metaDataArgument.ArgumentWithInvalidData;
	import tests.flex.lang.reflect.metadata.metaDataArgument.ArgumentWithValidData;
	import tests.flex.lang.reflect.metadata.utils.MetaDataToolsCase;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MetaDataSuite {
		public var validDataArgument:ArgumentWithValidData;
		public var invalidDataArgument:ArgumentWithInvalidData;
		public var validDataAnnotation:AnnotationWithValidData;
		public var invalidDataAnnotation:AnnotationWithInvalidData;
		public var utils:MetaDataToolsCase;
	}
}