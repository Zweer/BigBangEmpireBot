package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolButtonGoalGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonGoal = null;
      
      public var exclamationMark:SymbolGoalExclamationMarkGeneric = null;
      
      public var checkMark:SymbolGoalCheckmarkGeneric = null;
      
      public function SymbolButtonGoalGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonGoal;
         }
         else
         {
            _nativeObject = new SymbolButtonGoal();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         exclamationMark = new SymbolGoalExclamationMarkGeneric(_nativeObject.exclamationMark);
         checkMark = new SymbolGoalCheckmarkGeneric(_nativeObject.checkMark);
      }
      
      public function setNativeInstance(param1:SymbolButtonGoal) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.exclamationMark)
         {
            exclamationMark.setNativeInstance(_nativeObject.exclamationMark);
         }
         if(_nativeObject.checkMark)
         {
            checkMark.setNativeInstance(_nativeObject.checkMark);
         }
      }
   }
}
