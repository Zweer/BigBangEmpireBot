package visuals.dungeon_paths
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDungeon3_1PathGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeon3_1Path = null;
      
      public var step1_1:SymbolDungeonPathStepGeneric = null;
      
      public var step1_2:SymbolDungeonPathStepGeneric = null;
      
      public var step1_3:SymbolDungeonPathStepGeneric = null;
      
      public var step1_4:SymbolDungeonPathStepGeneric = null;
      
      public var step1_5:SymbolDungeonPathStepGeneric = null;
      
      public var step1_6:SymbolDungeonPathStepGeneric = null;
      
      public var step1_7:SymbolDungeonPathStepGeneric = null;
      
      public var step1_8:SymbolDungeonPathStepGeneric = null;
      
      public var step1_9:SymbolDungeonPathStepGeneric = null;
      
      public var step1_10:SymbolDungeonPathStepGeneric = null;
      
      public var step1_11:SymbolDungeonPathStepGeneric = null;
      
      public var step1_12:SymbolDungeonPathStepGeneric = null;
      
      public var step2_1:SymbolDungeonPathStepGeneric = null;
      
      public var step2_2:SymbolDungeonPathStepGeneric = null;
      
      public var step2_3:SymbolDungeonPathStepGeneric = null;
      
      public var step2_4:SymbolDungeonPathStepGeneric = null;
      
      public var step2_5:SymbolDungeonPathStepGeneric = null;
      
      public var step3_1:SymbolDungeonPathStepGeneric = null;
      
      public var step3_2:SymbolDungeonPathStepGeneric = null;
      
      public var step3_3:SymbolDungeonPathStepGeneric = null;
      
      public var checkpoint1:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint2:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint3:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint4:SymbolDungeonPathCheckPointGeneric = null;
      
      public function SymbolDungeon3_1PathGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeon3_1Path;
         }
         else
         {
            _nativeObject = new SymbolDungeon3_1Path();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         step1_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step1_1);
         step1_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step1_2);
         step1_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step1_3);
         step1_4 = new SymbolDungeonPathStepGeneric(_nativeObject.step1_4);
         step1_5 = new SymbolDungeonPathStepGeneric(_nativeObject.step1_5);
         step1_6 = new SymbolDungeonPathStepGeneric(_nativeObject.step1_6);
         step1_7 = new SymbolDungeonPathStepGeneric(_nativeObject.step1_7);
         step1_8 = new SymbolDungeonPathStepGeneric(_nativeObject.step1_8);
         step1_9 = new SymbolDungeonPathStepGeneric(_nativeObject.step1_9);
         step1_10 = new SymbolDungeonPathStepGeneric(_nativeObject.step1_10);
         step1_11 = new SymbolDungeonPathStepGeneric(_nativeObject.step1_11);
         step1_12 = new SymbolDungeonPathStepGeneric(_nativeObject.step1_12);
         step2_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step2_1);
         step2_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step2_2);
         step2_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step2_3);
         step2_4 = new SymbolDungeonPathStepGeneric(_nativeObject.step2_4);
         step2_5 = new SymbolDungeonPathStepGeneric(_nativeObject.step2_5);
         step3_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step3_1);
         step3_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step3_2);
         step3_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step3_3);
         checkpoint1 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint1);
         checkpoint2 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint2);
         checkpoint3 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint3);
         checkpoint4 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint4);
      }
      
      public function setNativeInstance(param1:SymbolDungeon3_1Path) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.step1_1)
         {
            step1_1.setNativeInstance(_nativeObject.step1_1);
         }
         if(_nativeObject.step1_2)
         {
            step1_2.setNativeInstance(_nativeObject.step1_2);
         }
         if(_nativeObject.step1_3)
         {
            step1_3.setNativeInstance(_nativeObject.step1_3);
         }
         if(_nativeObject.step1_4)
         {
            step1_4.setNativeInstance(_nativeObject.step1_4);
         }
         if(_nativeObject.step1_5)
         {
            step1_5.setNativeInstance(_nativeObject.step1_5);
         }
         if(_nativeObject.step1_6)
         {
            step1_6.setNativeInstance(_nativeObject.step1_6);
         }
         if(_nativeObject.step1_7)
         {
            step1_7.setNativeInstance(_nativeObject.step1_7);
         }
         if(_nativeObject.step1_8)
         {
            step1_8.setNativeInstance(_nativeObject.step1_8);
         }
         if(_nativeObject.step1_9)
         {
            step1_9.setNativeInstance(_nativeObject.step1_9);
         }
         if(_nativeObject.step1_10)
         {
            step1_10.setNativeInstance(_nativeObject.step1_10);
         }
         if(_nativeObject.step1_11)
         {
            step1_11.setNativeInstance(_nativeObject.step1_11);
         }
         if(_nativeObject.step1_12)
         {
            step1_12.setNativeInstance(_nativeObject.step1_12);
         }
         if(_nativeObject.step2_1)
         {
            step2_1.setNativeInstance(_nativeObject.step2_1);
         }
         if(_nativeObject.step2_2)
         {
            step2_2.setNativeInstance(_nativeObject.step2_2);
         }
         if(_nativeObject.step2_3)
         {
            step2_3.setNativeInstance(_nativeObject.step2_3);
         }
         if(_nativeObject.step2_4)
         {
            step2_4.setNativeInstance(_nativeObject.step2_4);
         }
         if(_nativeObject.step2_5)
         {
            step2_5.setNativeInstance(_nativeObject.step2_5);
         }
         if(_nativeObject.step3_1)
         {
            step3_1.setNativeInstance(_nativeObject.step3_1);
         }
         if(_nativeObject.step3_2)
         {
            step3_2.setNativeInstance(_nativeObject.step3_2);
         }
         if(_nativeObject.step3_3)
         {
            step3_3.setNativeInstance(_nativeObject.step3_3);
         }
         if(_nativeObject.checkpoint1)
         {
            checkpoint1.setNativeInstance(_nativeObject.checkpoint1);
         }
         if(_nativeObject.checkpoint2)
         {
            checkpoint2.setNativeInstance(_nativeObject.checkpoint2);
         }
         if(_nativeObject.checkpoint3)
         {
            checkpoint3.setNativeInstance(_nativeObject.checkpoint3);
         }
         if(_nativeObject.checkpoint4)
         {
            checkpoint4.setNativeInstance(_nativeObject.checkpoint4);
         }
      }
   }
}
