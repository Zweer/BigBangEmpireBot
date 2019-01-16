package visuals.ui.elements.battle_skills
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   
   public class SymbolRerollCustomizeItemResultGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolRerollCustomizeItemResult = null;
      
      public var bg:SymbolBackgroundScalableGeneric = null;
      
      public var txtInfoAgain:ILabelArea = null;
      
      public var btnCustomizeAgain:SymbolButtonPremiumGeneric = null;
      
      public function SymbolRerollCustomizeItemResultGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolRerollCustomizeItemResult;
         }
         else
         {
            _nativeObject = new SymbolRerollCustomizeItemResult();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolBackgroundScalableGeneric(_nativeObject.bg);
         txtInfoAgain = FlashLabelArea.fromNative(_nativeObject.txtInfoAgain);
         btnCustomizeAgain = new SymbolButtonPremiumGeneric(_nativeObject.btnCustomizeAgain);
      }
      
      public function setNativeInstance(param1:SymbolRerollCustomizeItemResult) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         FlashLabelArea.setNativeInstance(txtInfoAgain,_nativeObject.txtInfoAgain);
         if(_nativeObject.btnCustomizeAgain)
         {
            btnCustomizeAgain.setNativeInstance(_nativeObject.btnCustomizeAgain);
         }
      }
   }
}
