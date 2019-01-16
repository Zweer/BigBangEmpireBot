package visuals.ui.elements.duel
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolHonorIconBigGeneric;
   
   public class SymbolHonorPanelGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolHonorPanel = null;
      
      public var txtOwnHonor:ILabel = null;
      
      public var iconOwnHonor:SymbolHonorIconBigGeneric = null;
      
      public function SymbolHonorPanelGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolHonorPanel;
         }
         else
         {
            _nativeObject = new SymbolHonorPanel();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtOwnHonor = FlashLabel.fromNative(_nativeObject.txtOwnHonor);
         iconOwnHonor = new SymbolHonorIconBigGeneric(_nativeObject.iconOwnHonor);
      }
      
      public function setNativeInstance(param1:SymbolHonorPanel) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtOwnHonor,_nativeObject.txtOwnHonor);
         if(_nativeObject.iconOwnHonor)
         {
            iconOwnHonor.setNativeInstance(_nativeObject.iconOwnHonor);
         }
      }
   }
}
