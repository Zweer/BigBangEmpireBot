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
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.icons.SymbolIconDurationGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconLevelStarGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   
   public class SymbolDialogGuildMemberGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildMember = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtName:ILabel = null;
      
      public var txtLevel:ILabelArea = null;
      
      public var txtJoinDate:ILabelArea = null;
      
      public var txtCoinDonation:ILabelArea = null;
      
      public var txtPremiumCurrencyDonation:ILabelArea = null;
      
      public var iconLevel:SymbolIconLevelStarGeneric = null;
      
      public var iconCoin:SymbolIconGameCurrencyGeneric = null;
      
      public var iconPremiumCurrency:SymbolIconPremiumCurrencyGeneric = null;
      
      public var symbolIconDuration:SymbolIconDurationGeneric = null;
      
      public var checkRankLeader:SymbolUiCheckboxGeneric = null;
      
      public var txtRankLeader:ILabelArea = null;
      
      public var txtRankCaption:ILabel = null;
      
      public var checkRankOfficer:SymbolUiCheckboxGeneric = null;
      
      public var txtRankOfficer:ILabelArea = null;
      
      public var checkRankMember:SymbolUiCheckboxGeneric = null;
      
      public var txtRankMember:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var btnKick:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolDialogGuildMemberGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildMember;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildMember();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtName = FlashLabel.fromNative(_nativeObject.txtName);
         txtLevel = FlashLabelArea.fromNative(_nativeObject.txtLevel);
         txtJoinDate = FlashLabelArea.fromNative(_nativeObject.txtJoinDate);
         txtCoinDonation = FlashLabelArea.fromNative(_nativeObject.txtCoinDonation);
         txtPremiumCurrencyDonation = FlashLabelArea.fromNative(_nativeObject.txtPremiumCurrencyDonation);
         iconLevel = new SymbolIconLevelStarGeneric(_nativeObject.iconLevel);
         iconCoin = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoin);
         iconPremiumCurrency = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconPremiumCurrency);
         symbolIconDuration = new SymbolIconDurationGeneric(_nativeObject.symbolIconDuration);
         checkRankLeader = new SymbolUiCheckboxGeneric(_nativeObject.checkRankLeader);
         txtRankLeader = FlashLabelArea.fromNative(_nativeObject.txtRankLeader);
         txtRankCaption = FlashLabel.fromNative(_nativeObject.txtRankCaption);
         checkRankOfficer = new SymbolUiCheckboxGeneric(_nativeObject.checkRankOfficer);
         txtRankOfficer = FlashLabelArea.fromNative(_nativeObject.txtRankOfficer);
         checkRankMember = new SymbolUiCheckboxGeneric(_nativeObject.checkRankMember);
         txtRankMember = FlashLabelArea.fromNative(_nativeObject.txtRankMember);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         btnKick = new SymbolUiButtonDefaultGeneric(_nativeObject.btnKick);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildMember) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabel.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(txtLevel,_nativeObject.txtLevel);
         FlashLabelArea.setNativeInstance(txtJoinDate,_nativeObject.txtJoinDate);
         FlashLabelArea.setNativeInstance(txtCoinDonation,_nativeObject.txtCoinDonation);
         FlashLabelArea.setNativeInstance(txtPremiumCurrencyDonation,_nativeObject.txtPremiumCurrencyDonation);
         if(_nativeObject.iconLevel)
         {
            iconLevel.setNativeInstance(_nativeObject.iconLevel);
         }
         if(_nativeObject.iconCoin)
         {
            iconCoin.setNativeInstance(_nativeObject.iconCoin);
         }
         if(_nativeObject.iconPremiumCurrency)
         {
            iconPremiumCurrency.setNativeInstance(_nativeObject.iconPremiumCurrency);
         }
         if(_nativeObject.symbolIconDuration)
         {
            symbolIconDuration.setNativeInstance(_nativeObject.symbolIconDuration);
         }
         if(_nativeObject.checkRankLeader)
         {
            checkRankLeader.setNativeInstance(_nativeObject.checkRankLeader);
         }
         FlashLabelArea.setNativeInstance(txtRankLeader,_nativeObject.txtRankLeader);
         FlashLabel.setNativeInstance(txtRankCaption,_nativeObject.txtRankCaption);
         if(_nativeObject.checkRankOfficer)
         {
            checkRankOfficer.setNativeInstance(_nativeObject.checkRankOfficer);
         }
         FlashLabelArea.setNativeInstance(txtRankOfficer,_nativeObject.txtRankOfficer);
         if(_nativeObject.checkRankMember)
         {
            checkRankMember.setNativeInstance(_nativeObject.checkRankMember);
         }
         FlashLabelArea.setNativeInstance(txtRankMember,_nativeObject.txtRankMember);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.btnKick)
         {
            btnKick.setNativeInstance(_nativeObject.btnKick);
         }
      }
   }
}
