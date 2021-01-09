package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolIconButtonCharacterGeneric;
   import visuals.ui.base.SymbolIconButtonMessageForwardGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultCheckedGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiButtonIconCheckGeneric;
   import visuals.ui.base.SymbolUiButtonIconDeleteGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineGeneric;
   import visuals.ui.elements.guild.SymbolButtonGuildGeneric;
   import visuals.ui.elements.guild.SymbolButtonGuildInviteTextGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   
   public class SymbolPrivateSystemMessageGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateSystemMessage = null;
      
      public var messageBackground:SymbolPanelStreamElementBackgroundGeneric = null;
      
      public var txtMessage:ILabelArea = null;
      
      public var scrollLine:SymbolScrollLineGeneric = null;
      
      public var scrollKnob:SymbolScrollKnobGeneric = null;
      
      public var btnPrivateConversationInviteAccept:SymbolUiButtonIconCheckGeneric = null;
      
      public var btnPrivateConversationInviteDecline:SymbolUiButtonIconDeleteGeneric = null;
      
      public var btnGuildAccept:SymbolUiButtonIconCheckGeneric = null;
      
      public var btnGuildDecline:SymbolUiButtonIconDeleteGeneric = null;
      
      public var btnGuildView:SymbolButtonGuildGeneric = null;
      
      public var btnCharacterView:SymbolIconButtonCharacterGeneric = null;
      
      public var btnSendMessage:SymbolIconButtonMessageForwardGeneric = null;
      
      public var btnGuildInviteYes:SymbolButtonGuildInviteTextGeneric = null;
      
      public var btnGuildInviteNo:SymbolUiButtonIconDeleteGeneric = null;
      
      public var btnPartnerAdParticipate:SymbolUiButtonDefaultCheckedGeneric = null;
      
      public var item1:SymbolItemSlotGeneric = null;
      
      public var btnAcceptItem:SymbolUiButtonDefaultCheckedGeneric = null;
      
      public var item2:SymbolItemSlotGeneric = null;
      
      public var item3:SymbolItemSlotGeneric = null;
      
      public var item4:SymbolItemSlotGeneric = null;
      
      public var item5:SymbolItemSlotGeneric = null;
      
      public var btnGeneric:SymbolUiButtonDefaultGeneric = null;
      
      public var txtInfo:ILabel = null;
      
      public var txtMessageMarriage:ILabelArea = null;
      
      public var txtSubject:ILabel = null;
      
      public var btnDelete:SymbolButtonDeletePrivateConversationGeneric = null;
      
      public var btnReply:SymbolButtonReplySystemMessageGeneric = null;
      
      public var txtDate:ILabel = null;
      
      public function SymbolPrivateSystemMessageGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateSystemMessage;
         }
         else
         {
            _nativeObject = new SymbolPrivateSystemMessage();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         messageBackground = new SymbolPanelStreamElementBackgroundGeneric(_nativeObject.messageBackground);
         txtMessage = FlashLabelArea.fromNative(_nativeObject.txtMessage);
         scrollLine = new SymbolScrollLineGeneric(_nativeObject.scrollLine);
         scrollKnob = new SymbolScrollKnobGeneric(_nativeObject.scrollKnob);
         btnPrivateConversationInviteAccept = new SymbolUiButtonIconCheckGeneric(_nativeObject.btnPrivateConversationInviteAccept);
         btnPrivateConversationInviteDecline = new SymbolUiButtonIconDeleteGeneric(_nativeObject.btnPrivateConversationInviteDecline);
         btnGuildAccept = new SymbolUiButtonIconCheckGeneric(_nativeObject.btnGuildAccept);
         btnGuildDecline = new SymbolUiButtonIconDeleteGeneric(_nativeObject.btnGuildDecline);
         btnGuildView = new SymbolButtonGuildGeneric(_nativeObject.btnGuildView);
         btnCharacterView = new SymbolIconButtonCharacterGeneric(_nativeObject.btnCharacterView);
         btnSendMessage = new SymbolIconButtonMessageForwardGeneric(_nativeObject.btnSendMessage);
         btnGuildInviteYes = new SymbolButtonGuildInviteTextGeneric(_nativeObject.btnGuildInviteYes);
         btnGuildInviteNo = new SymbolUiButtonIconDeleteGeneric(_nativeObject.btnGuildInviteNo);
         btnPartnerAdParticipate = new SymbolUiButtonDefaultCheckedGeneric(_nativeObject.btnPartnerAdParticipate);
         item1 = new SymbolItemSlotGeneric(_nativeObject.item1);
         btnAcceptItem = new SymbolUiButtonDefaultCheckedGeneric(_nativeObject.btnAcceptItem);
         item2 = new SymbolItemSlotGeneric(_nativeObject.item2);
         item3 = new SymbolItemSlotGeneric(_nativeObject.item3);
         item4 = new SymbolItemSlotGeneric(_nativeObject.item4);
         item5 = new SymbolItemSlotGeneric(_nativeObject.item5);
         btnGeneric = new SymbolUiButtonDefaultGeneric(_nativeObject.btnGeneric);
         txtInfo = FlashLabel.fromNative(_nativeObject.txtInfo);
         txtMessageMarriage = FlashLabelArea.fromNative(_nativeObject.txtMessageMarriage);
         txtSubject = FlashLabel.fromNative(_nativeObject.txtSubject);
         btnDelete = new SymbolButtonDeletePrivateConversationGeneric(_nativeObject.btnDelete);
         btnReply = new SymbolButtonReplySystemMessageGeneric(_nativeObject.btnReply);
         txtDate = FlashLabel.fromNative(_nativeObject.txtDate);
      }
      
      public function setNativeInstance(param1:SymbolPrivateSystemMessage) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.messageBackground)
         {
            messageBackground.setNativeInstance(_nativeObject.messageBackground);
         }
         FlashLabelArea.setNativeInstance(txtMessage,_nativeObject.txtMessage);
         if(_nativeObject.scrollLine)
         {
            scrollLine.setNativeInstance(_nativeObject.scrollLine);
         }
         if(_nativeObject.scrollKnob)
         {
            scrollKnob.setNativeInstance(_nativeObject.scrollKnob);
         }
         if(_nativeObject.btnPrivateConversationInviteAccept)
         {
            btnPrivateConversationInviteAccept.setNativeInstance(_nativeObject.btnPrivateConversationInviteAccept);
         }
         if(_nativeObject.btnPrivateConversationInviteDecline)
         {
            btnPrivateConversationInviteDecline.setNativeInstance(_nativeObject.btnPrivateConversationInviteDecline);
         }
         if(_nativeObject.btnGuildAccept)
         {
            btnGuildAccept.setNativeInstance(_nativeObject.btnGuildAccept);
         }
         if(_nativeObject.btnGuildDecline)
         {
            btnGuildDecline.setNativeInstance(_nativeObject.btnGuildDecline);
         }
         if(_nativeObject.btnGuildView)
         {
            btnGuildView.setNativeInstance(_nativeObject.btnGuildView);
         }
         if(_nativeObject.btnCharacterView)
         {
            btnCharacterView.setNativeInstance(_nativeObject.btnCharacterView);
         }
         if(_nativeObject.btnSendMessage)
         {
            btnSendMessage.setNativeInstance(_nativeObject.btnSendMessage);
         }
         if(_nativeObject.btnGuildInviteYes)
         {
            btnGuildInviteYes.setNativeInstance(_nativeObject.btnGuildInviteYes);
         }
         if(_nativeObject.btnGuildInviteNo)
         {
            btnGuildInviteNo.setNativeInstance(_nativeObject.btnGuildInviteNo);
         }
         if(_nativeObject.btnPartnerAdParticipate)
         {
            btnPartnerAdParticipate.setNativeInstance(_nativeObject.btnPartnerAdParticipate);
         }
         if(_nativeObject.item1)
         {
            item1.setNativeInstance(_nativeObject.item1);
         }
         if(_nativeObject.btnAcceptItem)
         {
            btnAcceptItem.setNativeInstance(_nativeObject.btnAcceptItem);
         }
         if(_nativeObject.item2)
         {
            item2.setNativeInstance(_nativeObject.item2);
         }
         if(_nativeObject.item3)
         {
            item3.setNativeInstance(_nativeObject.item3);
         }
         if(_nativeObject.item4)
         {
            item4.setNativeInstance(_nativeObject.item4);
         }
         if(_nativeObject.item5)
         {
            item5.setNativeInstance(_nativeObject.item5);
         }
         if(_nativeObject.btnGeneric)
         {
            btnGeneric.setNativeInstance(_nativeObject.btnGeneric);
         }
         FlashLabel.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabelArea.setNativeInstance(txtMessageMarriage,_nativeObject.txtMessageMarriage);
         FlashLabel.setNativeInstance(txtSubject,_nativeObject.txtSubject);
         if(_nativeObject.btnDelete)
         {
            btnDelete.setNativeInstance(_nativeObject.btnDelete);
         }
         if(_nativeObject.btnReply)
         {
            btnReply.setNativeInstance(_nativeObject.btnReply);
         }
         FlashLabel.setNativeInstance(txtDate,_nativeObject.txtDate);
      }
   }
}
