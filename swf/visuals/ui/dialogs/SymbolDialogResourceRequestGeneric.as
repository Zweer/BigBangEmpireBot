package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.resource_request.SymbolResourceRequestFriendContentGeneric;
   import visuals.ui.elements.resource_request.SymbolResourceRequestLinkContentGeneric;
   
   public class SymbolDialogResourceRequestGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogResourceRequest = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var friendContent:SymbolResourceRequestFriendContentGeneric = null;
      
      public var linkContent:SymbolResourceRequestLinkContentGeneric = null;
      
      public var tabFriends:SymbolButtonTabGeneric = null;
      
      public var tabLink:SymbolButtonTabGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogResourceRequestGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogResourceRequest;
         }
         else
         {
            _nativeObject = new SymbolDialogResourceRequest();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         friendContent = new SymbolResourceRequestFriendContentGeneric(_nativeObject.friendContent);
         linkContent = new SymbolResourceRequestLinkContentGeneric(_nativeObject.linkContent);
         tabFriends = new SymbolButtonTabGeneric(_nativeObject.tabFriends);
         tabLink = new SymbolButtonTabGeneric(_nativeObject.tabLink);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogResourceRequest) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.dialogBackground)
         {
            dialogBackground.setNativeInstance(_nativeObject.dialogBackground);
         }
         if(_nativeObject.friendContent)
         {
            friendContent.setNativeInstance(_nativeObject.friendContent);
         }
         if(_nativeObject.linkContent)
         {
            linkContent.setNativeInstance(_nativeObject.linkContent);
         }
         if(_nativeObject.tabFriends)
         {
            tabFriends.setNativeInstance(_nativeObject.tabFriends);
         }
         if(_nativeObject.tabLink)
         {
            tabLink.setNativeInstance(_nativeObject.tabLink);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
