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
package tests.flex.lang.reflect {
	import tests.flex.lang.reflect.builders.BuilderSuite;
	import tests.flex.lang.reflect.constructor.ConstructorSuite;
	import tests.flex.lang.reflect.field.FieldSuite;
	import tests.flex.lang.reflect.klass.KlassSuite;
	import tests.flex.lang.reflect.metadata.MetaDataSuite;
	import tests.flex.lang.reflect.method.MethodSuite;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class ReflectionSuite {
		public var metaDataSuite:MetaDataSuite;
		public var fieldSuite:FieldSuite;
		public var methodSuite:MethodSuite;
		public var constructorSuite:ConstructorSuite;
		public var klassSuite:KlassSuite;
		public var builderSuite:BuilderSuite;
		
	}
}