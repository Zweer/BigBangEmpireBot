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
   import visuals.ui.base.SymbolIconButtonCharacterGeneric;
   import visuals.ui.base.SymbolIconButtonIgnoreGeneric;
   import visuals.ui.base.SymbolIconButtonMessageDeleteGeneric;
   import visuals.ui.base.SymbolIconButtonMessageForwardGeneric;
   import visuals.ui.base.SymbolIconButtonReportGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultCheckedGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiButtonIconCheckGeneric;
   import visuals.ui.base.SymbolUiButtonIconDeleteGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineGeneric;
   import visuals.ui.elements.guild.SymbolButtonGuildGeneric;
   import visuals.ui.elements.guild.SymbolButtonGuildInviteTextGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderFemaleGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderMaleGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildGeneric;
   import visuals.ui.elements.icons.SymbolIconOnlineGeneric;
   import visuals.ui.elements.icons.SymbolIconSystemMailGeneric;
   import visuals.ui.elements.item.SymbolItemSlotGeneric;
   import visuals.ui.elements.mail.SymbolMailSpecialBackdropGeneric;
   
   public class SymbolDialogMailReadGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogMailRead = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var iconReceiverOnline:SymbolIconOnlineGeneric = null;
      
      public var iconSenderOnline:SymbolIconOnlineGeneric = null;
      
      public var iconSenderSystemMail:SymbolIconSystemMailGeneric = null;
      
      public var iconReceiverGenderFemale:SymbolIconGenderFemaleGeneric = null;
      
      public var iconReceiverGenderMale:SymbolIconGenderMaleGeneric = null;
      
      public var iconReceiverGuild:SymbolIconGuildGeneric = null;
      
      public var iconSenderGenderMale:SymbolIconGenderMaleGeneric = null;
      
      public var iconSenderGenderFemale:SymbolIconGenderFemaleGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtSubjectCaption:ILabel = null;
      
      public var txtMessage:ILabelArea = null;
      
      public var txtSenderCaption:ILabel = null;
      
      public var txtDate:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnReply:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDateCaption:ILabel = null;
      
      public var txtReceiverCaption:ILabel = null;
      
      public var txtSender:ILabel = null;
      
      public var txtReceiverRight:ILabel = null;
      
      public var txtReceiver:ILabel = null;
      
      public var txtSubject:ILabel = null;
      
      public var txtUnread:ILabelArea = null;
      
      public var btnLast:SymbolButtonArrowLeftGeneric = null;
      
      public var btnNext:SymbolButtonArrowRightGeneric = null;
      
      public var btnShowSender:SymbolIconButtonCharacterGeneric = null;
      
      public var btnIgnore:SymbolIconButtonIgnoreGeneric = null;
      
      public var btnDelete:SymbolIconButtonMessageDeleteGeneric = null;
      
      public var btnForward:SymbolIconButtonMessageForwardGeneric = null;
      
      public var btnReport:SymbolIconButtonReportGeneric = null;
      
      public var specialBackdrop:SymbolMailSpecialBackdropGeneric = null;
      
      public var scrollLine:SymbolScrollLineGeneric = null;
      
      public var scrollKnob:SymbolScrollKnobGeneric = null;
      
      public var btnGuildAccept:SymbolUiButtonIconCheckGeneric = null;
      
      public var btnGuildDecline:SymbolUiButtonIconDeleteGeneric = null;
      
      public var btnGuildView:SymbolButtonGuildGeneric = null;
      
      public var btnGuildInviteYes:SymbolButtonGuildInviteTextGeneric = null;
      
      public var btnGuildInviteNo:SymbolUiButtonIconDeleteGeneric = null;
      
      public var btnPartnerAdParticipate:SymbolUiButtonDefaultCheckedGeneric = null;
      
      public var specialBackdropAcceptItem:SymbolMailSpecialBackdropGeneric = null;
      
      public var item1:SymbolItemSlotGeneric = null;
      
      public var btnAcceptItem:SymbolUiButtonDefaultCheckedGeneric = null;
      
      public var txtAlreadyClaimed:ILabel = null;
      
      public var item2:SymbolItemSlotGeneric = null;
      
      public var item3:SymbolItemSlotGeneric = null;
      
      public var item4:SymbolItemSlotGeneric = null;
      
      public var item5:SymbolItemSlotGeneric = null;
      
      public var specialBackdropMarriage:SymbolMailSpecialBackdropGeneric = null;
      
      public var txtMessageMarriage:ILabelArea = null;
      
      public var btnGeneric:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogMailReadGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogMailRead;
         }
         else
         {
            _nativeObject = new SymbolDialogMailRead();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         iconReceiverOnline = new SymbolIconOnlineGeneric(_nativeObject.iconReceiverOnline);
         iconSenderOnline = new SymbolIconOnlineGeneric(_nativeObject.iconSenderOnline);
         iconSenderSystemMail = new SymbolIconSystemMailGeneric(_nativeObject.iconSenderSystemMail);
         iconReceiverGenderFemale = new SymbolIconGenderFemaleGeneric(_nativeObject.iconReceiverGenderFemale);
         iconReceiverGenderMale = new SymbolIconGenderMaleGeneric(_nativeObject.iconReceiverGenderMale);
         iconReceiverGuild = new SymbolIconGuildGeneric(_nativeObject.iconReceiverGuild);
         iconSenderGenderMale = new SymbolIconGenderMaleGeneric(_nativeObject.iconSenderGenderMale);
         iconSenderGenderFemale = new SymbolIconGenderFemaleGeneric(_nativeObject.iconSenderGenderFemale);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtSubjectCaption = FlashLabel.fromNative(_nativeObject.txtSubjectCaption);
         txtMessage = FlashLabelArea.fromNative(_nativeObject.txtMessage);
         txtSenderCaption = FlashLabel.fromNative(_nativeObject.txtSenderCaption);
         txtDate = FlashLabel.fromNative(_nativeObject.txtDate);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnReply = new SymbolUiButtonDefaultGeneric(_nativeObject.btnReply);
         txtDateCaption = FlashLabel.fromNative(_nativeObject.txtDateCaption);
         txtReceiverCaption = FlashLabel.fromNative(_nativeObject.txtReceiverCaption);
         txtSender = FlashLabel.fromNative(_nativeObject.txtSender);
         txtReceiverRight = FlashLabel.fromNative(_nativeObject.txtReceiverRight);
         txtReceiver = FlashLabel.fromNative(_nativeObject.txtReceiver);
         txtSubject = FlashLabel.fromNative(_nativeObject.txtSubject);
         txtUnread = FlashLabelArea.fromNative(_nativeObject.txtUnread);
         btnLast = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLast);
         btnNext = new SymbolButtonArrowRightGeneric(_nativeObject.btnNext);
         btnShowSender = new SymbolIconButtonCharacterGeneric(_nativeObject.btnShowSender);
         btnIgnore = new SymbolIconButtonIgnoreGeneric(_nativeObject.btnIgnore);
         btnDelete = new SymbolIconButtonMessageDeleteGeneric(_nativeObject.btnDelete);
         btnForward = new SymbolIconButtonMessageForwardGeneric(_nativeObject.btnForward);
         btnReport = new SymbolIconButtonReportGeneric(_nativeObject.btnReport);
         specialBackdrop = new SymbolMailSpecialBackdropGeneric(_nativeObject.specialBackdrop);
         scrollLine = new SymbolScrollLineGeneric(_nativeObject.scrollLine);
         scrollKnob = new SymbolScrollKnobGeneric(_nativeObject.scrollKnob);
         btnGuildAccept = new SymbolUiButtonIconCheckGeneric(_nativeObject.btnGuildAccept);
         btnGuildDecline = new SymbolUiButtonIconDeleteGeneric(_nativeObject.btnGuildDecline);
         btnGuildView = new SymbolButtonGuildGeneric(_nativeObject.btnGuildView);
         btnGuildInviteYes = new SymbolButtonGuildInviteTextGeneric(_nativeObject.btnGuildInviteYes);
         btnGuildInviteNo = new SymbolUiButtonIconDeleteGeneric(_nativeObject.btnGuildInviteNo);
         btnPartnerAdParticipate = new SymbolUiButtonDefaultCheckedGeneric(_nativeObject.btnPartnerAdParticipate);
         specialBackdropAcceptItem = new SymbolMailSpecialBackdropGeneric(_nativeObject.specialBackdropAcceptItem);
         item1 = new SymbolItemSlotGeneric(_nativeObject.item1);
         btnAcceptItem = new SymbolUiButtonDefaultCheckedGeneric(_nativeObject.btnAcceptItem);
         txtAlreadyClaimed = FlashLabel.fromNative(_nativeObject.txtAlreadyClaimed);
         item2 = new SymbolItemSlotGeneric(_nativeObject.item2);
         item3 = new SymbolItemSlotGeneric(_nativeObject.item3);
         item4 = new SymbolItemSlotGeneric(_nativeObject.item4);
         item5 = new SymbolItemSlotGeneric(_nativeObject.item5);
         specialBackdropMarriage = new SymbolMailSpecialBackdropGeneric(_nativeObject.specialBackdropMarriage);
         txtMessageMarriage = FlashLabelArea.fromNative(_nativeObject.txtMessageMarriage);
         btnGeneric = new SymbolUiButtonDefaultGeneric(_nativeObject.btnGeneric);
      }
      
      public function setNativeInstance(param1:SymbolDialogMailRead) : void
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
         if(_nativeObject.iconReceiverOnline)
         {
            iconReceiverOnline.setNativeInstance(_nativeObject.iconReceiverOnline);
         }
         if(_nativeObject.iconSenderOnline)
         {
            iconSenderOnline.setNativeInstance(_nativeObject.iconSenderOnline);
         }
         if(_nativeObject.iconSenderSystemMail)
         {
            iconSenderSystemMail.setNativeInstance(_nativeObject.iconSenderSystemMail);
         }
         if(_nativeObject.iconReceiverGenderFemale)
         {
            iconReceiverGenderFemale.setNativeInstance(_nativeObject.iconReceiverGenderFemale);
         }
         if(_nativeObject.iconReceiverGenderMale)
         {
            iconReceiverGenderMale.setNativeInstance(_nativeObject.iconReceiverGenderMale);
         }
         if(_nativeObject.iconReceiverGuild)
         {
            iconReceiverGuild.setNativeInstance(_nativeObject.iconReceiverGuild);
         }
         if(_nativeObject.iconSenderGenderMale)
         {
            iconSenderGenderMale.setNativeInstance(_nativeObject.iconSenderGenderMale);
         }
         if(_nativeObject.iconSenderGenderFemale)
         {
            iconSenderGenderFemale.setNativeInstance(_nativeObject.iconSenderGenderFemale);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabel.setNativeInstance(txtSubjectCaption,_nativeObject.txtSubjectCaption);
         FlashLabelArea.setNativeInstance(txtMessage,_nativeObject.txtMessage);
         FlashLabel.setNativeInstance(txtSenderCaption,_nativeObject.txtSenderCaption);
         FlashLabel.setNativeInstance(txtDate,_nativeObject.txtDate);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnReply)
         {
            btnReply.setNativeInstance(_nativeObject.btnReply);
         }
         FlashLabel.setNativeInstance(txtDateCaption,_nativeObject.txtDateCaption);
         FlashLabel.setNativeInstance(txtReceiverCaption,_nativeObject.txtReceiverCaption);
         FlashLabel.setNativeInstance(txtSender,_nativeObject.txtSender);
         FlashLabel.setNativeInstance(txtReceiverRight,_nativeObject.txtReceiverRight);
         FlashLabel.setNativeInstance(txtReceiver,_nativeObject.txtReceiver);
         FlashLabel.setNativeInstance(txtSubject,_nativeObject.txtSubject);
         FlashLabelArea.setNativeInstance(txtUnread,_nativeObject.txtUnread);
         if(_nativeObject.btnLast)
         {
            btnLast.setNativeInstance(_nativeObject.btnLast);
         }
         if(_nativeObject.btnNext)
         {
            btnNext.setNativeInstance(_nativeObject.btnNext);
         }
         if(_nativeObject.btnShowSender)
         {
            btnShowSender.setNativeInstance(_nativeObject.btnShowSender);
         }
         if(_nativeObject.btnIgnore)
         {
            btnIgnore.setNativeInstance(_nativeObject.btnIgnore);
         }
         if(_nativeObject.btnDelete)
         {
            btnDelete.setNativeInstance(_nativeObject.btnDelete);
         }
         if(_nativeObject.btnForward)
         {
            btnForward.setNativeInstance(_nativeObject.btnForward);
         }
         if(_nativeObject.btnReport)
         {
            btnReport.setNativeInstance(_nativeObject.btnReport);
         }
         if(_nativeObject.specialBackdrop)
         {
            specialBackdrop.setNativeInstance(_nativeObject.specialBackdrop);
         }
         if(_nativeObject.scrollLine)
         {
            scrollLine.setNativeInstance(_nativeObject.scrollLine);
         }
         if(_nativeObject.scrollKnob)
         {
            scrollKnob.setNativeInstance(_nativeObject.scrollKnob);
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
         if(_nativeObject.specialBackdropAcceptItem)
         {
            specialBackdropAcceptItem.setNativeInstance(_nativeObject.specialBackdropAcceptItem);
         }
         if(_nativeObject.item1)
         {
            item1.setNativeInstance(_nativeObject.item1);
         }
         if(_nativeObject.btnAcceptItem)
         {
            btnAcceptItem.setNativeInstance(_nativeObject.btnAcceptItem);
         }
         FlashLabel.setNativeInstance(txtAlreadyClaimed,_nativeObject.txtAlreadyClaimed);
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
         if(_nativeObject.specialBackdropMarriage)
         {
            specialBackdropMarriage.setNativeInstance(_nativeObject.specialBackdropMarriage);
         }
         FlashLabelArea.setNativeInstance(txtMessageMarriage,_nativeObject.txtMessageMarriage);
         if(_nativeObject.btnGeneric)
         {
            btnGeneric.setNativeInstance(_nativeObject.btnGeneric);
         }
      }
   }
}
