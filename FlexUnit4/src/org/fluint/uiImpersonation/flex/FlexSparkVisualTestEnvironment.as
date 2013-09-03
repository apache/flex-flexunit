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
package org.fluint.uiImpersonation.flex
{
	import flash.display.DisplayObject;

	/**
	 * Builds a visual test environment for Flex 4.0 and above projects 
	 * @author jadkins
	 * 
	 */
	public class FlexSparkVisualTestEnvironment extends FlexMXVisualTestEnvironment
	{
		/**
		 * Adds a visual element to the test environment. Although this method takes a 
		 * DisplayObject, the display object must implement the IVisualElement interface.
		 * 
		 * @param element visual element to add
		 * @return A reference to the visual element
		 */
		override public function addElement( element:DisplayObject ):DisplayObject {
			return ( testEnvironment as Object ).addElement( element );
		}
		
		/**
		 * Adds a visual element at the specified index. Any elements at or above this index will be
		 * shifted up to accomodate. Although this method takes a DisplayObject, the display object 
		 * must implement the IVisualElement interface.
		 * 
		 * @param element visual element to add
		 * @param index index to insert the element
		 * @return a reference to the added element
		 * 
		 */
		override public function addElementAt(element:DisplayObject, index:int):DisplayObject {
			return ( testEnvironment as Object ).addElementAt( element, index );
		}
		
		/**
		 * Remove the specified visual element from the test environment. Although this method takes 
		 * a DisplayObject, the display object must implement the IVisualElement interface.
		 * 
		 * @param element visual element to remove
		 * @return a reference to the removed element
		 * 
		 */
		override public function removeElement(element:DisplayObject):DisplayObject {
			return ( testEnvironment as Object ).removeElement( element );
		}
		
		/**
		 * Removes the visual element at the specified index, returning a reference to the removed
		 * element.
		 * 
		 * @param index location of element to remove
		 * @return reference to removed element
		 * 
		 */
		override public function removeElementAt(index:int):DisplayObject {
			return ( testEnvironment as Object ).removeElementAt( index );
		}
		
		/**
		 * Removes all elements from the test environment.
		 * 
		 */
		override public function removeAllElements():void {
			( testEnvironment as Object ).removeAllElements();
		}
		
		/**
		 * Changes the position of the specified element to the new index. Although this method takes 
		 * a DisplayObject, the display object must implement the IVisualElement interface.
		 * 
		 * @param element visual element to change
		 * @param index new index of the element
		 * 
		 */
		override public function setElementIndex(element:DisplayObject, index:int):void {
			( testEnvironment as Object ).setElementIndex( element, index );
		}
		
		/**
		 * Returns the visual element at the specified index without removing the element
		 * 
		 * @param index location of visual element to retrieve
		 * @return reference to the requested element
		 * 
		 */
		override public function getElementAt(index:int):DisplayObject {
			return ( testEnvironment as Object ).getElementAt( index );
		}
		
		/**
		 * Retrieves the index of the specified visual element.
		 * 
		 * @param element reference to the element
		 * @return location of the element
		 * 
		 */
		override public function getElementIndex(element:DisplayObject):int {
			return ( testEnvironment as Object ).getElementIndex( element );
		}
		
		/**
		 * 
		 * Constructor
		 * 
		 * <p>Creates a new test environment using the <code>baseClass</code> as a base. This base
		 * needs to be a container that implements <code>IVisualElementContainer</code>.</p>
		 * 
		 * @param baseClass A class reference to the container the environment should be built from.
		 * 
		 */
		public function FlexSparkVisualTestEnvironment( baseClass:Class ) {
			super( baseClass );
		}
	}
}