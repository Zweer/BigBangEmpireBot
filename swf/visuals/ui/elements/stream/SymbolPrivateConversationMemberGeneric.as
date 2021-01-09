package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolIconButtonCharacterGeneric;
   import visuals.ui.base.SymbolIconButtonIgnoreGeneric;
   import visuals.ui.base.SymbolIconButtonReportGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundRoundedGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderFemaleGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderMaleGeneric;
   
   public class SymbolPrivateConversationMemberGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateConversationMember = null;
      
      public var background:SymbolSlice9BackgroundRoundedGeneric = null;
      
      public var txtName:ILabel = null;
      
      public var iconReceiverGenderFemale:SymbolIconGenderFemaleGeneric = null;
      
      public var iconReceiverGenderMale:SymbolIconGenderMaleGeneric = null;
      
      public var actionBarBackground:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var btnShowSender:SymbolIconButtonCharacterGeneric = null;
      
      public var btnIgnore:SymbolIconButtonIgnoreGeneric = null;
      
      public var btnReport:SymbolIconButtonReportGeneric = null;
      
      public function SymbolPrivateConversationMemberGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateConversationMember;
         }
         else
         {
            _nativeObject = new SymbolPrivateConversationMember();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundRoundedGeneric(_nativeObject.background);
         txtName = FlashLabel.fromNative(_nativeObject.txtName);
         iconReceiverGenderFemale = new SymbolIconGenderFemaleGeneric(_nativeObject.iconReceiverGenderFemale);
         iconReceiverGenderMale = new SymbolIconGenderMaleGeneric(_nativeObject.iconReceiverGenderMale);
         actionBarBackground = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.actionBarBackground);
         btnShowSender = new SymbolIconButtonCharacterGeneric(_nativeObject.btnShowSender);
         btnIgnore = new SymbolIconButtonIgnoreGeneric(_nativeObject.btnIgnore);
         btnReport = new SymbolIconButtonReportGeneric(_nativeObject.btnReport);
      }
      
      public function setNativeInstance(param1:SymbolPrivateConversationMember) : void
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
         FlashLabel.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.iconReceiverGenderFemale)
         {
            iconReceiverGenderFemale.setNativeInstance(_nativeObject.iconReceiverGenderFemale);
         }
         if(_nativeObject.iconReceiverGenderMale)
         {
            iconReceiverGenderMale.setNativeInstance(_nativeObject.iconReceiverGenderMale);
         }
         if(_nativeObject.actionBarBackground)
         {
            actionBarBackground.setNativeInstance(_nativeObject.actionBarBackground);
         }
         if(_nativeObject.btnShowSender)
         {
            btnShowSender.setNativeInstance(_nativeObject.btnShowSender);
         }
         if(_nativeObject.btnIgnore)
         {
            btnIgnore.setNativeInstance(_nativeObject.btnIgnore);
         }
         if(_nativeObject.btnReport)
         {
            btnReport.setNativeInstance(_nativeObject.btnReport);
         }
      }
   }
}
