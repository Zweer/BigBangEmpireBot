package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolUiDialogGuildJoinInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiDialogGuildJoinInfo = null;
      
      public var background:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var btnJoin:SymbolUiButtonDefaultGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolUiDialogGuildJoinInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiDialogGuildJoinInfo;
         }
         else
         {
            _nativeObject = new SymbolUiDialogGuildJoinInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.background);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         btnJoin = new SymbolUiButtonDefaultGeneric(_nativeObject.btnJoin);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolUiDialogGuildJoinInfo) : void
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
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.btnJoin)
         {
            btnJoin.setNativeInstance(_nativeObject.btnJoin);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
