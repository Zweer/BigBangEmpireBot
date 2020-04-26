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
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.guild.SymbolButtonGuildBattleAttackGeneric;
   import visuals.ui.elements.icons.SymbolIconGameCurrencyGeneric;
   
   public class SymbolDialogGuildBattleCreateGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildBattleCreate = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var checkTime1:SymbolUiCheckboxGeneric = null;
      
      public var txtTime1:ILabelArea = null;
      
      public var txtTimeCaption:ILabel = null;
      
      public var checkTime2:SymbolUiCheckboxGeneric = null;
      
      public var txtTime2:ILabelArea = null;
      
      public var checkTime3:SymbolUiCheckboxGeneric = null;
      
      public var txtTime3:ILabelArea = null;
      
      public var checkTime4:SymbolUiCheckboxGeneric = null;
      
      public var txtTime4:ILabelArea = null;
      
      public var checkTime5:SymbolUiCheckboxGeneric = null;
      
      public var txtTime5:ILabelArea = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var iconCoin:SymbolIconGameCurrencyGeneric = null;
      
      public var txtCoins:ILabel = null;
      
      public var txtCostCaption:ILabel = null;
      
      public var btnAttack:SymbolButtonGuildBattleAttackGeneric = null;
      
      public function SymbolDialogGuildBattleCreateGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildBattleCreate;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildBattleCreate();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         checkTime1 = new SymbolUiCheckboxGeneric(_nativeObject.checkTime1);
         txtTime1 = FlashLabelArea.fromNative(_nativeObject.txtTime1);
         txtTimeCaption = FlashLabel.fromNative(_nativeObject.txtTimeCaption);
         checkTime2 = new SymbolUiCheckboxGeneric(_nativeObject.checkTime2);
         txtTime2 = FlashLabelArea.fromNative(_nativeObject.txtTime2);
         checkTime3 = new SymbolUiCheckboxGeneric(_nativeObject.checkTime3);
         txtTime3 = FlashLabelArea.fromNative(_nativeObject.txtTime3);
         checkTime4 = new SymbolUiCheckboxGeneric(_nativeObject.checkTime4);
         txtTime4 = FlashLabelArea.fromNative(_nativeObject.txtTime4);
         checkTime5 = new SymbolUiCheckboxGeneric(_nativeObject.checkTime5);
         txtTime5 = FlashLabelArea.fromNative(_nativeObject.txtTime5);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         iconCoin = new SymbolIconGameCurrencyGeneric(_nativeObject.iconCoin);
         txtCoins = FlashLabel.fromNative(_nativeObject.txtCoins);
         txtCostCaption = FlashLabel.fromNative(_nativeObject.txtCostCaption);
         btnAttack = new SymbolButtonGuildBattleAttackGeneric(_nativeObject.btnAttack);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildBattleCreate) : void
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
         if(_nativeObject.checkTime1)
         {
            checkTime1.setNativeInstance(_nativeObject.checkTime1);
         }
         FlashLabelArea.setNativeInstance(txtTime1,_nativeObject.txtTime1);
         FlashLabel.setNativeInstance(txtTimeCaption,_nativeObject.txtTimeCaption);
         if(_nativeObject.checkTime2)
         {
            checkTime2.setNativeInstance(_nativeObject.checkTime2);
         }
         FlashLabelArea.setNativeInstance(txtTime2,_nativeObject.txtTime2);
         if(_nativeObject.checkTime3)
         {
            checkTime3.setNativeInstance(_nativeObject.checkTime3);
         }
         FlashLabelArea.setNativeInstance(txtTime3,_nativeObject.txtTime3);
         if(_nativeObject.checkTime4)
         {
            checkTime4.setNativeInstance(_nativeObject.checkTime4);
         }
         FlashLabelArea.setNativeInstance(txtTime4,_nativeObject.txtTime4);
         if(_nativeObject.checkTime5)
         {
            checkTime5.setNativeInstance(_nativeObject.checkTime5);
         }
         FlashLabelArea.setNativeInstance(txtTime5,_nativeObject.txtTime5);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.iconCoin)
         {
            iconCoin.setNativeInstance(_nativeObject.iconCoin);
         }
         FlashLabel.setNativeInstance(txtCoins,_nativeObject.txtCoins);
         FlashLabel.setNativeInstance(txtCostCaption,_nativeObject.txtCostCaption);
         if(_nativeObject.btnAttack)
         {
            btnAttack.setNativeInstance(_nativeObject.btnAttack);
         }
      }
   }
}
