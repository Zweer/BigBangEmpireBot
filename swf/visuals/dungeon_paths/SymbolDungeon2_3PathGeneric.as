package visuals.dungeon_paths
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolDungeon2_3PathGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDungeon2_3Path = null;
      
      public var step12_3:SymbolDungeonPathStepGeneric = null;
      
      public var step12_2:SymbolDungeonPathStepGeneric = null;
      
      public var step12_1:SymbolDungeonPathStepGeneric = null;
      
      public var step11_6:SymbolDungeonPathStepGeneric = null;
      
      public var step11_5:SymbolDungeonPathStepGeneric = null;
      
      public var step11_4:SymbolDungeonPathStepGeneric = null;
      
      public var step11_3:SymbolDungeonPathStepGeneric = null;
      
      public var step11_2:SymbolDungeonPathStepGeneric = null;
      
      public var step11_1:SymbolDungeonPathStepGeneric = null;
      
      public var step10_3:SymbolDungeonPathStepGeneric = null;
      
      public var step10_2:SymbolDungeonPathStepGeneric = null;
      
      public var step10_1:SymbolDungeonPathStepGeneric = null;
      
      public var step9_3:SymbolDungeonPathStepGeneric = null;
      
      public var step9_2:SymbolDungeonPathStepGeneric = null;
      
      public var step9_1:SymbolDungeonPathStepGeneric = null;
      
      public var step13_3:SymbolDungeonPathStepGeneric = null;
      
      public var step13_2:SymbolDungeonPathStepGeneric = null;
      
      public var step13_1:SymbolDungeonPathStepGeneric = null;
      
      public var step12_7:SymbolDungeonPathStepGeneric = null;
      
      public var step12_6:SymbolDungeonPathStepGeneric = null;
      
      public var step12_5:SymbolDungeonPathStepGeneric = null;
      
      public var step12_4:SymbolDungeonPathStepGeneric = null;
      
      public var step12_8:SymbolDungeonPathStepGeneric = null;
      
      public var checkpoint10:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint11:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint12:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint13:SymbolDungeonPathCheckPointGeneric = null;
      
      public var checkpoint14:SymbolDungeonPathCheckPointGeneric = null;
      
      public function SymbolDungeon2_3PathGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDungeon2_3Path;
         }
         else
         {
            _nativeObject = new SymbolDungeon2_3Path();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         step12_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step12_3);
         step12_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step12_2);
         step12_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step12_1);
         step11_6 = new SymbolDungeonPathStepGeneric(_nativeObject.step11_6);
         step11_5 = new SymbolDungeonPathStepGeneric(_nativeObject.step11_5);
         step11_4 = new SymbolDungeonPathStepGeneric(_nativeObject.step11_4);
         step11_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step11_3);
         step11_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step11_2);
         step11_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step11_1);
         step10_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step10_3);
         step10_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step10_2);
         step10_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step10_1);
         step9_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step9_3);
         step9_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step9_2);
         step9_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step9_1);
         step13_3 = new SymbolDungeonPathStepGeneric(_nativeObject.step13_3);
         step13_2 = new SymbolDungeonPathStepGeneric(_nativeObject.step13_2);
         step13_1 = new SymbolDungeonPathStepGeneric(_nativeObject.step13_1);
         step12_7 = new SymbolDungeonPathStepGeneric(_nativeObject.step12_7);
         step12_6 = new SymbolDungeonPathStepGeneric(_nativeObject.step12_6);
         step12_5 = new SymbolDungeonPathStepGeneric(_nativeObject.step12_5);
         step12_4 = new SymbolDungeonPathStepGeneric(_nativeObject.step12_4);
         step12_8 = new SymbolDungeonPathStepGeneric(_nativeObject.step12_8);
         checkpoint10 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint10);
         checkpoint11 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint11);
         checkpoint12 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint12);
         checkpoint13 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint13);
         checkpoint14 = new SymbolDungeonPathCheckPointGeneric(_nativeObject.checkpoint14);
      }
      
      public function setNativeInstance(param1:SymbolDungeon2_3Path) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.step12_3)
         {
            step12_3.setNativeInstance(_nativeObject.step12_3);
         }
         if(_nativeObject.step12_2)
         {
            step12_2.setNativeInstance(_nativeObject.step12_2);
         }
         if(_nativeObject.step12_1)
         {
            step12_1.setNativeInstance(_nativeObject.step12_1);
         }
         if(_nativeObject.step11_6)
         {
            step11_6.setNativeInstance(_nativeObject.step11_6);
         }
         if(_nativeObject.step11_5)
         {
            step11_5.setNativeInstance(_nativeObject.step11_5);
         }
         if(_nativeObject.step11_4)
         {
            step11_4.setNativeInstance(_nativeObject.step11_4);
         }
         if(_nativeObject.step11_3)
         {
            step11_3.setNativeInstance(_nativeObject.step11_3);
         }
         if(_nativeObject.step11_2)
         {
            step11_2.setNativeInstance(_nativeObject.step11_2);
         }
         if(_nativeObject.step11_1)
         {
            step11_1.setNativeInstance(_nativeObject.step11_1);
         }
         if(_nativeObject.step10_3)
         {
            step10_3.setNativeInstance(_nativeObject.step10_3);
         }
         if(_nativeObject.step10_2)
         {
            step10_2.setNativeInstance(_nativeObject.step10_2);
         }
         if(_nativeObject.step10_1)
         {
            step10_1.setNativeInstance(_nativeObject.step10_1);
         }
         if(_nativeObject.step9_3)
         {
            step9_3.setNativeInstance(_nativeObject.step9_3);
         }
         if(_nativeObject.step9_2)
         {
            step9_2.setNativeInstance(_nativeObject.step9_2);
         }
         if(_nativeObject.step9_1)
         {
            step9_1.setNativeInstance(_nativeObject.step9_1);
         }
         if(_nativeObject.step13_3)
         {
            step13_3.setNativeInstance(_nativeObject.step13_3);
         }
         if(_nativeObject.step13_2)
         {
            step13_2.setNativeInstance(_nativeObject.step13_2);
         }
         if(_nativeObject.step13_1)
         {
            step13_1.setNativeInstance(_nativeObject.step13_1);
         }
         if(_nativeObject.step12_7)
         {
            step12_7.setNativeInstance(_nativeObject.step12_7);
         }
         if(_nativeObject.step12_6)
         {
            step12_6.setNativeInstance(_nativeObject.step12_6);
         }
         if(_nativeObject.step12_5)
         {
            step12_5.setNativeInstance(_nativeObject.step12_5);
         }
         if(_nativeObject.step12_4)
         {
            step12_4.setNativeInstance(_nativeObject.step12_4);
         }
         if(_nativeObject.step12_8)
         {
            step12_8.setNativeInstance(_nativeObject.step12_8);
         }
         if(_nativeObject.checkpoint10)
         {
            checkpoint10.setNativeInstance(_nativeObject.checkpoint10);
         }
         if(_nativeObject.checkpoint11)
         {
            checkpoint11.setNativeInstance(_nativeObject.checkpoint11);
         }
         if(_nativeObject.checkpoint12)
         {
            checkpoint12.setNativeInstance(_nativeObject.checkpoint12);
         }
         if(_nativeObject.checkpoint13)
         {
            checkpoint13.setNativeInstance(_nativeObject.checkpoint13);
         }
         if(_nativeObject.checkpoint14)
         {
            checkpoint14.setNativeInstance(_nativeObject.checkpoint14);
         }
      }
   }
}
