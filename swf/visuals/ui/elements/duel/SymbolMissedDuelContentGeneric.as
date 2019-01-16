package visuals.ui.elements.duel
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
   import visuals.ui.base.SymbolIconButtonMessageDeleteAllGeneric;
   import visuals.ui.base.SymbolIconButtonMessageDeleteGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPremiumGeneric;
   import visuals.ui.elements.mail.SymbolButtonSendMessageTextGeneric;
   
   public class SymbolMissedDuelContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMissedDuelContent = null;
      
      public var duel1:SymbolMissedDuelLineGeneric = null;
      
      public var duel2:SymbolMissedDuelLineGeneric = null;
      
      public var duel3:SymbolMissedDuelLineGeneric = null;
      
      public var duel4:SymbolMissedDuelLineGeneric = null;
      
      public var duel5:SymbolMissedDuelLineGeneric = null;
      
      public var duel6:SymbolMissedDuelLineGeneric = null;
      
      public var duel7:SymbolMissedDuelLineGeneric = null;
      
      public var duel8:SymbolMissedDuelLineGeneric = null;
      
      public var duel9:SymbolMissedDuelLineGeneric = null;
      
      public var duel10:SymbolMissedDuelLineGeneric = null;
      
      public var txtDateCaption:ILabel = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var txtLevelCaption:ILabel = null;
      
      public var txtResultsCaption:ILabel = null;
      
      public var checkAutoShown:SymbolUiCheckboxGeneric = null;
      
      public var txtAutoShown:ILabelArea = null;
      
      public var summary:SymbolMissedDuelSummaryGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnViewFight:SymbolUiButtonDefaultGeneric = null;
      
      public var btnCounterAttack:SymbolButtonPremiumGeneric = null;
      
      public var btnSendMessage:SymbolButtonSendMessageTextGeneric = null;
      
      public var btnViewPlayer:SymbolIconButtonCharacterGeneric = null;
      
      public var btnDelete:SymbolIconButtonMessageDeleteGeneric = null;
      
      public var btnDeleteAll:SymbolIconButtonMessageDeleteAllGeneric = null;
      
      public var txtNoDuels:ILabelArea = null;
      
      public function SymbolMissedDuelContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMissedDuelContent;
         }
         else
         {
            _nativeObject = new SymbolMissedDuelContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         duel1 = new SymbolMissedDuelLineGeneric(_nativeObject.duel1);
         duel2 = new SymbolMissedDuelLineGeneric(_nativeObject.duel2);
         duel3 = new SymbolMissedDuelLineGeneric(_nativeObject.duel3);
         duel4 = new SymbolMissedDuelLineGeneric(_nativeObject.duel4);
         duel5 = new SymbolMissedDuelLineGeneric(_nativeObject.duel5);
         duel6 = new SymbolMissedDuelLineGeneric(_nativeObject.duel6);
         duel7 = new SymbolMissedDuelLineGeneric(_nativeObject.duel7);
         duel8 = new SymbolMissedDuelLineGeneric(_nativeObject.duel8);
         duel9 = new SymbolMissedDuelLineGeneric(_nativeObject.duel9);
         duel10 = new SymbolMissedDuelLineGeneric(_nativeObject.duel10);
         txtDateCaption = FlashLabel.fromNative(_nativeObject.txtDateCaption);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         txtLevelCaption = FlashLabel.fromNative(_nativeObject.txtLevelCaption);
         txtResultsCaption = FlashLabel.fromNative(_nativeObject.txtResultsCaption);
         checkAutoShown = new SymbolUiCheckboxGeneric(_nativeObject.checkAutoShown);
         txtAutoShown = FlashLabelArea.fromNative(_nativeObject.txtAutoShown);
         summary = new SymbolMissedDuelSummaryGeneric(_nativeObject.summary);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         btnViewFight = new SymbolUiButtonDefaultGeneric(_nativeObject.btnViewFight);
         btnCounterAttack = new SymbolButtonPremiumGeneric(_nativeObject.btnCounterAttack);
         btnSendMessage = new SymbolButtonSendMessageTextGeneric(_nativeObject.btnSendMessage);
         btnViewPlayer = new SymbolIconButtonCharacterGeneric(_nativeObject.btnViewPlayer);
         btnDelete = new SymbolIconButtonMessageDeleteGeneric(_nativeObject.btnDelete);
         btnDeleteAll = new SymbolIconButtonMessageDeleteAllGeneric(_nativeObject.btnDeleteAll);
         txtNoDuels = FlashLabelArea.fromNative(_nativeObject.txtNoDuels);
      }
      
      public function setNativeInstance(param1:SymbolMissedDuelContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.duel1)
         {
            duel1.setNativeInstance(_nativeObject.duel1);
         }
         if(_nativeObject.duel2)
         {
            duel2.setNativeInstance(_nativeObject.duel2);
         }
         if(_nativeObject.duel3)
         {
            duel3.setNativeInstance(_nativeObject.duel3);
         }
         if(_nativeObject.duel4)
         {
            duel4.setNativeInstance(_nativeObject.duel4);
         }
         if(_nativeObject.duel5)
         {
            duel5.setNativeInstance(_nativeObject.duel5);
         }
         if(_nativeObject.duel6)
         {
            duel6.setNativeInstance(_nativeObject.duel6);
         }
         if(_nativeObject.duel7)
         {
            duel7.setNativeInstance(_nativeObject.duel7);
         }
         if(_nativeObject.duel8)
         {
            duel8.setNativeInstance(_nativeObject.duel8);
         }
         if(_nativeObject.duel9)
         {
            duel9.setNativeInstance(_nativeObject.duel9);
         }
         if(_nativeObject.duel10)
         {
            duel10.setNativeInstance(_nativeObject.duel10);
         }
         FlashLabel.setNativeInstance(txtDateCaption,_nativeObject.txtDateCaption);
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashLabel.setNativeInstance(txtLevelCaption,_nativeObject.txtLevelCaption);
         FlashLabel.setNativeInstance(txtResultsCaption,_nativeObject.txtResultsCaption);
         if(_nativeObject.checkAutoShown)
         {
            checkAutoShown.setNativeInstance(_nativeObject.checkAutoShown);
         }
         FlashLabelArea.setNativeInstance(txtAutoShown,_nativeObject.txtAutoShown);
         if(_nativeObject.summary)
         {
            summary.setNativeInstance(_nativeObject.summary);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.btnViewFight)
         {
            btnViewFight.setNativeInstance(_nativeObject.btnViewFight);
         }
         if(_nativeObject.btnCounterAttack)
         {
            btnCounterAttack.setNativeInstance(_nativeObject.btnCounterAttack);
         }
         if(_nativeObject.btnSendMessage)
         {
            btnSendMessage.setNativeInstance(_nativeObject.btnSendMessage);
         }
         if(_nativeObject.btnViewPlayer)
         {
            btnViewPlayer.setNativeInstance(_nativeObject.btnViewPlayer);
         }
         if(_nativeObject.btnDelete)
         {
            btnDelete.setNativeInstance(_nativeObject.btnDelete);
         }
         if(_nativeObject.btnDeleteAll)
         {
            btnDeleteAll.setNativeInstance(_nativeObject.btnDeleteAll);
         }
         FlashLabelArea.setNativeInstance(txtNoDuels,_nativeObject.txtNoDuels);
      }
   }
}
