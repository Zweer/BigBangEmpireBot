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
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.guild.SymbolGuildBattleHistoryLineGeneric;
   
   public class SymbolDialogGuildBattleHistoryGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildBattleHistory = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtDateCaption:ILabel = null;
      
      public var txtEnemyNameCaption:ILabel = null;
      
      public var txtJoinedCaption:ILabel = null;
      
      public var txtResultsCaption:ILabel = null;
      
      public var line1:SymbolGuildBattleHistoryLineGeneric = null;
      
      public var line2:SymbolGuildBattleHistoryLineGeneric = null;
      
      public var line3:SymbolGuildBattleHistoryLineGeneric = null;
      
      public var line4:SymbolGuildBattleHistoryLineGeneric = null;
      
      public var line5:SymbolGuildBattleHistoryLineGeneric = null;
      
      public var line6:SymbolGuildBattleHistoryLineGeneric = null;
      
      public var line7:SymbolGuildBattleHistoryLineGeneric = null;
      
      public var line8:SymbolGuildBattleHistoryLineGeneric = null;
      
      public var line9:SymbolGuildBattleHistoryLineGeneric = null;
      
      public var line10:SymbolGuildBattleHistoryLineGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnViewFight:SymbolUiButtonDefaultGeneric = null;
      
      public var btnViewEnemy:SymbolUiButtonDefaultGeneric = null;
      
      public var txtNoBattles:ILabelArea = null;
      
      public function SymbolDialogGuildBattleHistoryGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildBattleHistory;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildBattleHistory();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtDateCaption = FlashLabel.fromNative(_nativeObject.txtDateCaption);
         txtEnemyNameCaption = FlashLabel.fromNative(_nativeObject.txtEnemyNameCaption);
         txtJoinedCaption = FlashLabel.fromNative(_nativeObject.txtJoinedCaption);
         txtResultsCaption = FlashLabel.fromNative(_nativeObject.txtResultsCaption);
         line1 = new SymbolGuildBattleHistoryLineGeneric(_nativeObject.line1);
         line2 = new SymbolGuildBattleHistoryLineGeneric(_nativeObject.line2);
         line3 = new SymbolGuildBattleHistoryLineGeneric(_nativeObject.line3);
         line4 = new SymbolGuildBattleHistoryLineGeneric(_nativeObject.line4);
         line5 = new SymbolGuildBattleHistoryLineGeneric(_nativeObject.line5);
         line6 = new SymbolGuildBattleHistoryLineGeneric(_nativeObject.line6);
         line7 = new SymbolGuildBattleHistoryLineGeneric(_nativeObject.line7);
         line8 = new SymbolGuildBattleHistoryLineGeneric(_nativeObject.line8);
         line9 = new SymbolGuildBattleHistoryLineGeneric(_nativeObject.line9);
         line10 = new SymbolGuildBattleHistoryLineGeneric(_nativeObject.line10);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         btnViewFight = new SymbolUiButtonDefaultGeneric(_nativeObject.btnViewFight);
         btnViewEnemy = new SymbolUiButtonDefaultGeneric(_nativeObject.btnViewEnemy);
         txtNoBattles = FlashLabelArea.fromNative(_nativeObject.txtNoBattles);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildBattleHistory) : void
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
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabel.setNativeInstance(txtDateCaption,_nativeObject.txtDateCaption);
         FlashLabel.setNativeInstance(txtEnemyNameCaption,_nativeObject.txtEnemyNameCaption);
         FlashLabel.setNativeInstance(txtJoinedCaption,_nativeObject.txtJoinedCaption);
         FlashLabel.setNativeInstance(txtResultsCaption,_nativeObject.txtResultsCaption);
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
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
         if(_nativeObject.line6)
         {
            line6.setNativeInstance(_nativeObject.line6);
         }
         if(_nativeObject.line7)
         {
            line7.setNativeInstance(_nativeObject.line7);
         }
         if(_nativeObject.line8)
         {
            line8.setNativeInstance(_nativeObject.line8);
         }
         if(_nativeObject.line9)
         {
            line9.setNativeInstance(_nativeObject.line9);
         }
         if(_nativeObject.line10)
         {
            line10.setNativeInstance(_nativeObject.line10);
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
         if(_nativeObject.btnViewEnemy)
         {
            btnViewEnemy.setNativeInstance(_nativeObject.btnViewEnemy);
         }
         FlashLabelArea.setNativeInstance(txtNoBattles,_nativeObject.txtNoBattles);
      }
   }
}
