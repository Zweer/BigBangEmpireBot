package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolStoryGoalsCompleteGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStoryGoalsComplete = null;
      
      public var m:SymbolStoryGoalsBarMaskGeneric = null;
      
      public var txtProgress:ILabel = null;
      
      public var checked:SymbolCheckGlowingGeneric = null;
      
      public function SymbolStoryGoalsCompleteGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStoryGoalsComplete;
         }
         else
         {
            _nativeObject = new SymbolStoryGoalsComplete();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         m = new SymbolStoryGoalsBarMaskGeneric(_nativeObject.m);
         txtProgress = FlashLabel.fromNative(_nativeObject.txtProgress);
         checked = new SymbolCheckGlowingGeneric(_nativeObject.checked);
      }
      
      public function setNativeInstance(param1:SymbolStoryGoalsComplete) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
         FlashLabel.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         if(_nativeObject.checked)
         {
            checked.setNativeInstance(_nativeObject.checked);
         }
      }
   }
}
