package com.playata.framework.application
{
   import com.playata.framework.core.ICore;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.layout.ILayout;
   
   public class EnvironmentConfig
   {
       
      
      public var core:ICore;
      
      public var clientVersion:int;
      
      public var defaultConfig:TypedObject;
      
      public var tweenClass:Class;
      
      public var deviceClass:Class;
      
      public var applicationClass:Class;
      
      public var displayCoreClass:Class;
      
      public var networkCoreClass:Class;
      
      public var networkInfoClass:Class;
      
      public var audioCoreClass:Class;
      
      public var inputCoreClass:Class;
      
      public var physicsCoreClass:Class;
      
      public var taskManagerClass:Class;
      
      public var layout:ILayout;
      
      public var errorReporter:IErrorReporter;
      
      public function EnvironmentConfig()
      {
         super();
      }
   }
}
