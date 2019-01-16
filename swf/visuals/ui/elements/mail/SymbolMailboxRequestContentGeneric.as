package visuals.ui.elements.mail
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultCheckedWideGeneric;
   import visuals.ui.base.SymbolUiButtonWideGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonPhotoBigGeneric;
   
   public class SymbolMailboxRequestContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMailboxRequestContent = null;
      
      public var line1:SymbolMailboxRequestLineGeneric = null;
      
      public var line2:SymbolMailboxRequestLineGeneric = null;
      
      public var line3:SymbolMailboxRequestLineGeneric = null;
      
      public var line4:SymbolMailboxRequestLineGeneric = null;
      
      public var btnAcceptAll:SymbolUiButtonDefaultCheckedWideGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var txtNoRequests:ILabelArea = null;
      
      public var photo1:SymbolDungeonPhotoBigGeneric = null;
      
      public var photo2:SymbolDungeonPhotoBigGeneric = null;
      
      public var photo3:SymbolDungeonPhotoBigGeneric = null;
      
      public var btnInvite:SymbolUiButtonWideGeneric = null;
      
      public var ckbFriendRequestsOnly:SymbolUiCheckboxGeneric = null;
      
      public var txtFriendRequestsOnly:ILabel = null;
      
      public function SymbolMailboxRequestContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMailboxRequestContent;
         }
         else
         {
            _nativeObject = new SymbolMailboxRequestContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line1 = new SymbolMailboxRequestLineGeneric(_nativeObject.line1);
         line2 = new SymbolMailboxRequestLineGeneric(_nativeObject.line2);
         line3 = new SymbolMailboxRequestLineGeneric(_nativeObject.line3);
         line4 = new SymbolMailboxRequestLineGeneric(_nativeObject.line4);
         btnAcceptAll = new SymbolUiButtonDefaultCheckedWideGeneric(_nativeObject.btnAcceptAll);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         txtNoRequests = FlashLabelArea.fromNative(_nativeObject.txtNoRequests);
         photo1 = new SymbolDungeonPhotoBigGeneric(_nativeObject.photo1);
         photo2 = new SymbolDungeonPhotoBigGeneric(_nativeObject.photo2);
         photo3 = new SymbolDungeonPhotoBigGeneric(_nativeObject.photo3);
         btnInvite = new SymbolUiButtonWideGeneric(_nativeObject.btnInvite);
         ckbFriendRequestsOnly = new SymbolUiCheckboxGeneric(_nativeObject.ckbFriendRequestsOnly);
         txtFriendRequestsOnly = FlashLabel.fromNative(_nativeObject.txtFriendRequestsOnly);
      }
      
      public function setNativeInstance(param1:SymbolMailboxRequestContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.line4)
         {
            line4.setNativeInstance(_nativeObject.line4);
         }
         if(_nativeObject.btnAcceptAll)
         {
            btnAcceptAll.setNativeInstance(_nativeObject.btnAcceptAll);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         FlashLabelArea.setNativeInstance(txtNoRequests,_nativeObject.txtNoRequests);
         if(_nativeObject.photo1)
         {
            photo1.setNativeInstance(_nativeObject.photo1);
         }
         if(_nativeObject.photo2)
         {
            photo2.setNativeInstance(_nativeObject.photo2);
         }
         if(_nativeObject.photo3)
         {
            photo3.setNativeInstance(_nativeObject.photo3);
         }
         if(_nativeObject.btnInvite)
         {
            btnInvite.setNativeInstance(_nativeObject.btnInvite);
         }
         if(_nativeObject.ckbFriendRequestsOnly)
         {
            ckbFriendRequestsOnly.setNativeInstance(_nativeObject.ckbFriendRequestsOnly);
         }
         FlashLabel.setNativeInstance(txtFriendRequestsOnly,_nativeObject.txtFriendRequestsOnly);
      }
   }
}
