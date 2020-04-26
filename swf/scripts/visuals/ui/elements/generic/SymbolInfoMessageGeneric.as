package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolInfoMessageGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolInfoMessage = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var txtMessage:ILabelArea = null;
      
      public var txtTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolInfoMessageGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolInfoMessage;
         }
         else
         {
            _nativeObject = new SymbolInfoMessage();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         txtMessage = FlashLabelArea.fromNative(_nativeObject.txtMessage);
         txtTitle = FlashLabel.fromNative(_nativeObject.txtTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolInfoMessage) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         FlashLabelArea.setNativeInstance(txtMessage,_nativeObject.txtMessage);
         FlashLabel.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
