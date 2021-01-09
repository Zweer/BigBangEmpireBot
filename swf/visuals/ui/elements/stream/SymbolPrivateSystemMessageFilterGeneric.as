package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   import visuals.ui.elements.generic.SymbolIconMarriageGeneric;
   import visuals.ui.elements.goal.SymbolIconSaveFilterGeneric;
   import visuals.ui.elements.icons.SymbolIconGiftGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildGeneric;
   import visuals.ui.elements.icons.SymbolIconSystemMailGeneric;
   
   public class SymbolPrivateSystemMessageFilterGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPrivateSystemMessageFilter = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var ckbShowSystemMails:SymbolUiCheckboxGeneric = null;
      
      public var txtShowSystemMails:ILabelArea = null;
      
      public var ckbShowItemMails:SymbolUiCheckboxGeneric = null;
      
      public var txtShowItemMails:ILabelArea = null;
      
      public var ckbShowTeamMails:SymbolUiCheckboxGeneric = null;
      
      public var txtShowTeamMails:ILabelArea = null;
      
      public var iconSystemMail:SymbolIconSystemMailGeneric = null;
      
      public var symbolIconGift:SymbolIconGiftGeneric = null;
      
      public var ckbShowProposeMarriageMails:SymbolUiCheckboxGeneric = null;
      
      public var txtShowProposeMarriageMails:ILabelArea = null;
      
      public var symbolIconMarriage:SymbolIconMarriageGeneric = null;
      
      public var btnSaveSettings:SymbolIconSaveFilterGeneric = null;
      
      public var symbolIconGuild:SymbolIconGuildGeneric = null;
      
      public function SymbolPrivateSystemMessageFilterGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPrivateSystemMessageFilter;
         }
         else
         {
            _nativeObject = new SymbolPrivateSystemMessageFilter();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         ckbShowSystemMails = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowSystemMails);
         txtShowSystemMails = FlashLabelArea.fromNative(_nativeObject.txtShowSystemMails);
         ckbShowItemMails = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowItemMails);
         txtShowItemMails = FlashLabelArea.fromNative(_nativeObject.txtShowItemMails);
         ckbShowTeamMails = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowTeamMails);
         txtShowTeamMails = FlashLabelArea.fromNative(_nativeObject.txtShowTeamMails);
         iconSystemMail = new SymbolIconSystemMailGeneric(_nativeObject.iconSystemMail);
         symbolIconGift = new SymbolIconGiftGeneric(_nativeObject.symbolIconGift);
         ckbShowProposeMarriageMails = new SymbolUiCheckboxGeneric(_nativeObject.ckbShowProposeMarriageMails);
         txtShowProposeMarriageMails = FlashLabelArea.fromNative(_nativeObject.txtShowProposeMarriageMails);
         symbolIconMarriage = new SymbolIconMarriageGeneric(_nativeObject.symbolIconMarriage);
         btnSaveSettings = new SymbolIconSaveFilterGeneric(_nativeObject.btnSaveSettings);
         symbolIconGuild = new SymbolIconGuildGeneric(_nativeObject.symbolIconGuild);
      }
      
      public function setNativeInstance(param1:SymbolPrivateSystemMessageFilter) : void
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
         if(_nativeObject.ckbShowSystemMails)
         {
            ckbShowSystemMails.setNativeInstance(_nativeObject.ckbShowSystemMails);
         }
         FlashLabelArea.setNativeInstance(txtShowSystemMails,_nativeObject.txtShowSystemMails);
         if(_nativeObject.ckbShowItemMails)
         {
            ckbShowItemMails.setNativeInstance(_nativeObject.ckbShowItemMails);
         }
         FlashLabelArea.setNativeInstance(txtShowItemMails,_nativeObject.txtShowItemMails);
         if(_nativeObject.ckbShowTeamMails)
         {
            ckbShowTeamMails.setNativeInstance(_nativeObject.ckbShowTeamMails);
         }
         FlashLabelArea.setNativeInstance(txtShowTeamMails,_nativeObject.txtShowTeamMails);
         if(_nativeObject.iconSystemMail)
         {
            iconSystemMail.setNativeInstance(_nativeObject.iconSystemMail);
         }
         if(_nativeObject.symbolIconGift)
         {
            symbolIconGift.setNativeInstance(_nativeObject.symbolIconGift);
         }
         if(_nativeObject.ckbShowProposeMarriageMails)
         {
            ckbShowProposeMarriageMails.setNativeInstance(_nativeObject.ckbShowProposeMarriageMails);
         }
         FlashLabelArea.setNativeInstance(txtShowProposeMarriageMails,_nativeObject.txtShowProposeMarriageMails);
         if(_nativeObject.symbolIconMarriage)
         {
            symbolIconMarriage.setNativeInstance(_nativeObject.symbolIconMarriage);
         }
         if(_nativeObject.btnSaveSettings)
         {
            btnSaveSettings.setNativeInstance(_nativeObject.btnSaveSettings);
         }
         if(_nativeObject.symbolIconGuild)
         {
            symbolIconGuild.setNativeInstance(_nativeObject.symbolIconGuild);
         }
      }
   }
}
