package visuals.dungeon_paths
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDungeon1_2PathGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeon1_2Path = null;
      
      public var step4_1:SymbolDungeonPathStepGeneric = null;
      
      public var step4_2:SymbolDungeonPathStepGeneric = null;
      
      public var step4_3:SymbolDungeonPathStepGeneric = null;
      
      public var step4_4:SymbolDungeonPathStepGeneric = null;
      
      public var step5_1:SymbolDungeonPathStepGeneric = null;
      
      public var step5_2:SymbolDungeonPathStepGeneric = null;
      
      public var step5_3:SymbolDungeonPathStepGeneric = null;
      
      public var step5_4:SymbolDungeonPathStepGeneric = null;
      
      public var step5_5:SymbolDungeonPathStepGeneric = null;
      
      public var step5_6:SymbolDungeonPathStepGeneric = null;
      
      public var step5_7:SymbolDungeonPathStepGeneric = null;
      
      public var step6_1:SymbolDungeonPathStepGeneric = null;
      
      public var step6_2:SymbolDungeonPathStepGeneric = null;
      
      public var step6_3:SymbolDungeonPathStepGeneric = null;
      
      public var step7_1:SymbolDungeonPathStepGeneric = null;
      
      public var step7_2:SymbolDungeonPathStepGeneric = null;
      
      public var step7_3:SymbolDungeonPathStepGeneric = null;
      
      public var step8_1:SymbolDungeonPathStepGeneric = null;
      
      public var step8_2:SymbolDungeonPathStepGeneric = null;
      
      public var step8_3:SymbolDungeonPathStepGeneric = null;
      
      public var step8_4:SymbolDungeonPathStepGeneric = null;
      
      public var step8_5:SymbolDungeonPathStepGeneric = null;
      
      public var step8_6:SymbolDungeonPathStepGeneric = null;
      
      public var step8_7:SymbolDungeonPathStepGeneric = null;
      
      public var step8_8:SymbolDungeonPathStepGeneric = null;
      
      public var step8_9:SymbolDungeonPathStepGeneric = null;
      
      public var step8_10:SymbolDungeonPathStepGeneric = null;
      
      public var checkpoint5:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint6:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint7:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint8:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint9:SymbolDungeonPathCheckPointGeneric = null;
      
      public function SymbolDungeon1_2PathGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeon1_2Path;
         }
         else
         {
            _nativeObject = new SymbolDungeon1_2Path();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         step4_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step4_1);
         step4_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step4_2);
         step4_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step4_3);
         step4_4 = new SymbolDungeonPathStepGeneric(_nativeObject.step4_4);
         step5_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_1);
         step5_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_2);
         step5_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_3);
         step5_4 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_4);
         step5_5 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_5);
         step5_6 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_6);
         step5_7 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_7);
         step6_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step6_1);
         step6_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step6_2);
         step6_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step6_3);
         step7_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_1);
         step7_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_2);
         step7_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_3);
         step8_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step8_1);
         step8_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step8_2);
         step8_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step8_3);
         step8_4 = new SymbolDungeonPathStepGeneric(_nativeObject.step8_4);
         step8_5 = new SymbolDungeonPathStepGeneric(_nativeObject.step8_5);
         step8_6 = new SymbolDungeonPathStepGeneric(_nativeObject.step8_6);
         step8_7 = new SymbolDungeonPathStepGeneric(_nativeObject.step8_7);
         step8_8 = new SymbolDungeonPathStepGeneric(_nativeObject.step8_8);
         step8_9 = new SymbolDungeonPathStepGeneric(_nativeObject.step8_9);
         step8_10 = new SymbolDungeonPathStepGeneric(_nativeObject.step8_10);
         checkpoint5 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint5);
         checkpoint6 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint6);
         checkpoint7 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint7);
         checkpoint8 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint8);
         checkpoint9 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint9);
      }
      
      public function setNativeInstance(param1:SymbolDungeon1_2Path) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.step4_1)
         {
            step4_1.setNativeInstance(_nativeObject.step4_1);
         }
         if(_nativeObject.step4_2)
         {
            step4_2.setNativeInstance(_nativeObject.step4_2);
         }
         if(_nativeObject.step4_3)
         {
            step4_3.setNativeInstance(_nativeObject.step4_3);
         }
         if(_nativeObject.step4_4)
         {
            step4_4.setNativeInstance(_nativeObject.step4_4);
         }
         if(_nativeObject.step5_1)
         {
            step5_1.setNativeInstance(_nativeObject.step5_1);
         }
         if(_nativeObject.step5_2)
         {
            step5_2.setNativeInstance(_nativeObject.step5_2);
         }
         if(_nativeObject.step5_3)
         {
            step5_3.setNativeInstance(_nativeObject.step5_3);
         }
         if(_nativeObject.step5_4)
         {
            step5_4.setNativeInstance(_nativeObject.step5_4);
         }
         if(_nativeObject.step5_5)
         {
            step5_5.setNativeInstance(_nativeObject.step5_5);
         }
         if(_nativeObject.step5_6)
         {
            step5_6.setNativeInstance(_nativeObject.step5_6);
         }
         if(_nativeObject.step5_7)
         {
            step5_7.setNativeInstance(_nativeObject.step5_7);
         }
         if(_nativeObject.step6_1)
         {
            step6_1.setNativeInstance(_nativeObject.step6_1);
         }
         if(_nativeObject.step6_2)
         {
            step6_2.setNativeInstance(_nativeObject.step6_2);
         }
         if(_nativeObject.step6_3)
         {
            step6_3.setNativeInstance(_nativeObject.step6_3);
         }
         if(_nativeObject.step7_1)
         {
            step7_1.setNativeInstance(_nativeObject.step7_1);
         }
         if(_nativeObject.step7_2)
         {
            step7_2.setNativeInstance(_nativeObject.step7_2);
         }
         if(_nativeObject.step7_3)
         {
            step7_3.setNativeInstance(_nativeObject.step7_3);
         }
         if(_nativeObject.step8_1)
         {
            step8_1.setNativeInstance(_nativeObject.step8_1);
         }
         if(_nativeObject.step8_2)
         {
            step8_2.setNativeInstance(_nativeObject.step8_2);
         }
         if(_nativeObject.step8_3)
         {
            step8_3.setNativeInstance(_nativeObject.step8_3);
         }
         if(_nativeObject.step8_4)
         {
            step8_4.setNativeInstance(_nativeObject.step8_4);
         }
         if(_nativeObject.step8_5)
         {
            step8_5.setNativeInstance(_nativeObject.step8_5);
         }
         if(_nativeObject.step8_6)
         {
            step8_6.setNativeInstance(_nativeObject.step8_6);
         }
         if(_nativeObject.step8_7)
         {
            step8_7.setNativeInstance(_nativeObject.step8_7);
         }
         if(_nativeObject.step8_8)
         {
            step8_8.setNativeInstance(_nativeObject.step8_8);
         }
         if(_nativeObject.step8_9)
         {
            step8_9.setNativeInstance(_nativeObject.step8_9);
         }
         if(_nativeObject.step8_10)
         {
            step8_10.setNativeInstance(_nativeObject.step8_10);
         }
         if(_nativeObject.checkpoint5)
         {
            checkpoint5.setNativeInstance(_nativeObject.checkpoint5);
         }
         if(_nativeObject.checkpoint6)
         {
            checkpoint6.setNativeInstance(_nativeObject.checkpoint6);
         }
         if(_nativeObject.checkpoint7)
         {
            checkpoint7.setNativeInstance(_nativeObject.checkpoint7);
         }
         if(_nativeObject.checkpoint8)
         {
            checkpoint8.setNativeInstance(_nativeObject.checkpoint8);
         }
         if(_nativeObject.checkpoint9)
         {
            checkpoint9.setNativeInstance(_nativeObject.checkpoint9);
         }
      }
   }
}
