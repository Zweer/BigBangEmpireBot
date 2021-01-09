package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolPrivateConversationHeaderGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateConversationHeader = null;
      
      public var moreMembers:SymbolPrivateConversationMemberMoreGeneric = null;
      
      public var members:SymbolPlaceholderGeneric = null;
      
      public var btnDelete:SymbolButtonDeletePrivateConversationGeneric = null;
      
      public var btnRename:SymbolButtonRenamePrivateConversationGeneric = null;
      
      public var btnInvite:SymbolButtonInvitePrivateConversationGeneric = null;
      
      public var btnLeave:SymbolButtonLeavePrivateConversationGeneric = null;
      
      public var txtTitle:ILabel = null;
      
      public function SymbolPrivateConversationHeaderGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateConversationHeader;
         }
         else
         {
            _nativeObject = new SymbolPrivateConversationHeader();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         moreMembers = new SymbolPrivateConversationMemberMoreGeneric(_nativeObject.moreMembers);
         members = new SymbolPlaceholderGeneric(_nativeObject.members);
         btnDelete = new SymbolButtonDeletePrivateConversationGeneric(_nativeObject.btnDelete);
         btnRename = new SymbolButtonRenamePrivateConversationGeneric(_nativeObject.btnRename);
         btnInvite = new SymbolButtonInvitePrivateConversationGeneric(_nativeObject.btnInvite);
         btnLeave = new SymbolButtonLeavePrivateConversationGeneric(_nativeObject.btnLeave);
         txtTitle = FlashLabel.fromNative(_nativeObject.txtTitle);
      }
      
      public function setNativeInstance(param1:SymbolPrivateConversationHeader) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.moreMembers)
         {
            moreMembers.setNativeInstance(_nativeObject.moreMembers);
         }
         if(_nativeObject.members)
         {
            members.setNativeInstance(_nativeObject.members);
         }
         if(_nativeObject.btnDelete)
         {
            btnDelete.setNativeInstance(_nativeObject.btnDelete);
         }
         if(_nativeObject.btnRename)
         {
            btnRename.setNativeInstance(_nativeObject.btnRename);
         }
         if(_nativeObject.btnInvite)
         {
            btnInvite.setNativeInstance(_nativeObject.btnInvite);
         }
         if(_nativeObject.btnLeave)
         {
            btnLeave.setNativeInstance(_nativeObject.btnLeave);
         }
         FlashLabel.setNativeInstance(txtTitle,_nativeObject.txtTitle);
      }
   }
}
