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
   import visuals.ui.elements.guild.SymbolGuildLeaderVoteLineGeneric;
   
   public class SymbolDialogGuildLeaderVoteSelectionGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildLeaderVoteSelection = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtNameCaption:ILabel = null;
      
      public var txtRankCaption:ILabel = null;
      
      public var txtLevelCaption:ILabel = null;
      
      public var line1:SymbolGuildLeaderVoteLineGeneric = null;
      
      public var line2:SymbolGuildLeaderVoteLineGeneric = null;
      
      public var line3:SymbolGuildLeaderVoteLineGeneric = null;
      
      public var line4:SymbolGuildLeaderVoteLineGeneric = null;
      
      public var line5:SymbolGuildLeaderVoteLineGeneric = null;
      
      public var line6:SymbolGuildLeaderVoteLineGeneric = null;
      
      public var line7:SymbolGuildLeaderVoteLineGeneric = null;
      
      public var line8:SymbolGuildLeaderVoteLineGeneric = null;
      
      public var line9:SymbolGuildLeaderVoteLineGeneric = null;
      
      public var line10:SymbolGuildLeaderVoteLineGeneric = null;
      
      public var line11:SymbolGuildLeaderVoteLineGeneric = null;
      
      public var line12:SymbolGuildLeaderVoteLineGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnEnclose:SymbolUiButtonDefaultGeneric = null;
      
      public var btnVote:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public function SymbolDialogGuildLeaderVoteSelectionGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildLeaderVoteSelection;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildLeaderVoteSelection();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtNameCaption = FlashLabel.fromNative(_nativeObject.txtNameCaption);
         txtRankCaption = FlashLabel.fromNative(_nativeObject.txtRankCaption);
         txtLevelCaption = FlashLabel.fromNative(_nativeObject.txtLevelCaption);
         line1 = new SymbolGuildLeaderVoteLineGeneric(_nativeObject.line1);
         line2 = new SymbolGuildLeaderVoteLineGeneric(_nativeObject.line2);
         line3 = new SymbolGuildLeaderVoteLineGeneric(_nativeObject.line3);
         line4 = new SymbolGuildLeaderVoteLineGeneric(_nativeObject.line4);
         line5 = new SymbolGuildLeaderVoteLineGeneric(_nativeObject.line5);
         line6 = new SymbolGuildLeaderVoteLineGeneric(_nativeObject.line6);
         line7 = new SymbolGuildLeaderVoteLineGeneric(_nativeObject.line7);
         line8 = new SymbolGuildLeaderVoteLineGeneric(_nativeObject.line8);
         line9 = new SymbolGuildLeaderVoteLineGeneric(_nativeObject.line9);
         line10 = new SymbolGuildLeaderVoteLineGeneric(_nativeObject.line10);
         line11 = new SymbolGuildLeaderVoteLineGeneric(_nativeObject.line11);
         line12 = new SymbolGuildLeaderVoteLineGeneric(_nativeObject.line12);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         btnEnclose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnEnclose);
         btnVote = new SymbolUiButtonDefaultGeneric(_nativeObject.btnVote);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildLeaderVoteSelection) : void
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
         FlashLabel.setNativeInstance(txtNameCaption,_nativeObject.txtNameCaption);
         FlashLabel.setNativeInstance(txtRankCaption,_nativeObject.txtRankCaption);
         FlashLabel.setNativeInstance(txtLevelCaption,_nativeObject.txtLevelCaption);
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
         if(_nativeObject.line11)
         {
            line11.setNativeInstance(_nativeObject.line11);
         }
         if(_nativeObject.line12)
         {
            line12.setNativeInstance(_nativeObject.line12);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.btnEnclose)
         {
            btnEnclose.setNativeInstance(_nativeObject.btnEnclose);
         }
         if(_nativeObject.btnVote)
         {
            btnVote.setNativeInstance(_nativeObject.btnVote);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
      }
   }
}
