package visuals.dungeon_paths
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDungeon2_2PathGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeon2_2Path = null;
      
      public var step5_1:SymbolDungeonPathStepGeneric = null;
      
      public var step5_2:SymbolDungeonPathStepGeneric = null;
      
      public var step5_3:SymbolDungeonPathStepGeneric = null;
      
      public var step5_4:SymbolDungeonPathStepGeneric = null;
      
      public var step5_5:SymbolDungeonPathStepGeneric = null;
      
      public var step5_6:SymbolDungeonPathStepGeneric = null;
      
      public var step5_7:SymbolDungeonPathStepGeneric = null;
      
      public var step5_8:SymbolDungeonPathStepGeneric = null;
      
      public var step5_9:SymbolDungeonPathStepGeneric = null;
      
      public var step5_10:SymbolDungeonPathStepGeneric = null;
      
      public var step5_11:SymbolDungeonPathStepGeneric = null;
      
      public var step6_1:SymbolDungeonPathStepGeneric = null;
      
      public var step6_2:SymbolDungeonPathStepGeneric = null;
      
      public var step6_3:SymbolDungeonPathStepGeneric = null;
      
      public var step6_4:SymbolDungeonPathStepGeneric = null;
      
      public var step6_5:SymbolDungeonPathStepGeneric = null;
      
      public var step7_1:SymbolDungeonPathStepGeneric = null;
      
      public var step7_2:SymbolDungeonPathStepGeneric = null;
      
      public var step7_3:SymbolDungeonPathStepGeneric = null;
      
      public var step7_5:SymbolDungeonPathStepGeneric = null;
      
      public var step7_6:SymbolDungeonPathStepGeneric = null;
      
      public var step7_7:SymbolDungeonPathStepGeneric = null;
      
      public var step7_8:SymbolDungeonPathStepGeneric = null;
      
      public var step7_9:SymbolDungeonPathStepGeneric = null;
      
      public var step7_10:SymbolDungeonPathStepGeneric = null;
      
      public var step7_11:SymbolDungeonPathStepGeneric = null;
      
      public var step7_12:SymbolDungeonPathStepGeneric = null;
      
      public var step7_13:SymbolDungeonPathStepGeneric = null;
      
      public var step7_14:SymbolDungeonPathStepGeneric = null;
      
      public var step7_15:SymbolDungeonPathStepGeneric = null;
      
      public var step7_16:SymbolDungeonPathStepGeneric = null;
      
      public var step8_1:SymbolDungeonPathStepGeneric = null;
      
      public var step8_2:SymbolDungeonPathStepGeneric = null;
      
      public var step7_4:SymbolDungeonPathStepGeneric = null;
      
      public var step6_6:SymbolDungeonPathStepGeneric = null;
      
      public var checkpoint5:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint6:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint7:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint8:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint9:SymbolDungeonPathCheckPointGeneric = null;
      
      public function SymbolDungeon2_2PathGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeon2_2Path;
         }
         else
         {
            _nativeObject = new SymbolDungeon2_2Path();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         step5_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_1);
         step5_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_2);
         step5_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_3);
         step5_4 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_4);
         step5_5 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_5);
         step5_6 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_6);
         step5_7 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_7);
         step5_8 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_8);
         step5_9 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_9);
         step5_10 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_10);
         step5_11 = new SymbolDungeonPathStepGeneric(_nativeObject.step5_11);
         step6_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step6_1);
         step6_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step6_2);
         step6_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step6_3);
         step6_4 = new SymbolDungeonPathStepGeneric(_nativeObject.step6_4);
         step6_5 = new SymbolDungeonPathStepGeneric(_nativeObject.step6_5);
         step7_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_1);
         step7_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_2);
         step7_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_3);
         step7_5 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_5);
         step7_6 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_6);
         step7_7 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_7);
         step7_8 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_8);
         step7_9 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_9);
         step7_10 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_10);
         step7_11 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_11);
         step7_12 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_12);
         step7_13 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_13);
         step7_14 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_14);
         step7_15 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_15);
         step7_16 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_16);
         step8_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step8_1);
         step8_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step8_2);
         step7_4 = new SymbolDungeonPathStepGeneric(_nativeObject.step7_4);
         step6_6 = new SymbolDungeonPathStepGeneric(_nativeObject.step6_6);
         checkpoint5 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint5);
         checkpoint6 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint6);
         checkpoint7 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint7);
         checkpoint8 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint8);
         checkpoint9 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint9);
      }
      
      public function setNativeInstance(param1:SymbolDungeon2_2Path) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
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
         if(_nativeObject.step5_8)
         {
            step5_8.setNativeInstance(_nativeObject.step5_8);
         }
         if(_nativeObject.step5_9)
         {
            step5_9.setNativeInstance(_nativeObject.step5_9);
         }
         if(_nativeObject.step5_10)
         {
            step5_10.setNativeInstance(_nativeObject.step5_10);
         }
         if(_nativeObject.step5_11)
         {
            step5_11.setNativeInstance(_nativeObject.step5_11);
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
         if(_nativeObject.step6_4)
         {
            step6_4.setNativeInstance(_nativeObject.step6_4);
         }
         if(_nativeObject.step6_5)
         {
            step6_5.setNativeInstance(_nativeObject.step6_5);
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
         if(_nativeObject.step7_5)
         {
            step7_5.setNativeInstance(_nativeObject.step7_5);
         }
         if(_nativeObject.step7_6)
         {
            step7_6.setNativeInstance(_nativeObject.step7_6);
         }
         if(_nativeObject.step7_7)
         {
            step7_7.setNativeInstance(_nativeObject.step7_7);
         }
         if(_nativeObject.step7_8)
         {
            step7_8.setNativeInstance(_nativeObject.step7_8);
         }
         if(_nativeObject.step7_9)
         {
            step7_9.setNativeInstance(_nativeObject.step7_9);
         }
         if(_nativeObject.step7_10)
         {
            step7_10.setNativeInstance(_nativeObject.step7_10);
         }
         if(_nativeObject.step7_11)
         {
            step7_11.setNativeInstance(_nativeObject.step7_11);
         }
         if(_nativeObject.step7_12)
         {
            step7_12.setNativeInstance(_nativeObject.step7_12);
         }
         if(_nativeObject.step7_13)
         {
            step7_13.setNativeInstance(_nativeObject.step7_13);
         }
         if(_nativeObject.step7_14)
         {
            step7_14.setNativeInstance(_nativeObject.step7_14);
         }
         if(_nativeObject.step7_15)
         {
            step7_15.setNativeInstance(_nativeObject.step7_15);
         }
         if(_nativeObject.step7_16)
         {
            step7_16.setNativeInstance(_nativeObject.step7_16);
         }
         if(_nativeObject.step8_1)
         {
            step8_1.setNativeInstance(_nativeObject.step8_1);
         }
         if(_nativeObject.step8_2)
         {
            step8_2.setNativeInstance(_nativeObject.step8_2);
         }
         if(_nativeObject.step7_4)
         {
            step7_4.setNativeInstance(_nativeObject.step7_4);
         }
         if(_nativeObject.step6_6)
         {
            step6_6.setNativeInstance(_nativeObject.step6_6);
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
