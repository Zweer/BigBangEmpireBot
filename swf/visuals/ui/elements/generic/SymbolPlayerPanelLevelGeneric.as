package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolPlayerPanelLevelGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPlayerPanelLevel = null;
      
      public var txtLevel:ILabel = null;
      
      public function SymbolPlayerPanelLevelGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPlayerPanelLevel;
         }
         else
         {
            _nativeObject = new SymbolPlayerPanelLevel();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtLevel = FlashLabel.fromNative(_nativeObject.txtLevel);
      }
      
      public function setNativeInstance(param1:SymbolPlayerPanelLevel) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtLevel,_nativeObject.txtLevel);
      }
   }
}
