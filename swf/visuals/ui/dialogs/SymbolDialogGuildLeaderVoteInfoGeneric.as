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
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   
   public class SymbolDialogGuildLeaderVoteInfoGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildLeaderVoteInfo = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtNeededVotes:ILabel = null;
      
      public var txtNeededVotesCaption:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtVoteOutVotes:ILabel = null;
      
      public var txtVoteOutVotesCaption:ILabel = null;
      
      public var txtKeepVotes:ILabel = null;
      
      public var txtKeepVotesCaption:ILabel = null;
      
      public var txtEndTime:ILabel = null;
      
      public var txtEndTimeCaption:ILabel = null;
      
      public var txtInfoBottom:ILabelArea = null;
      
      public var btnVoteOut:SymbolUiButtonDefaultGeneric = null;
      
      public var btnKeep:SymbolUiButtonDefaultGeneric = null;
      
      public var btnLater:SymbolUiButtonDefaultGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogGuildLeaderVoteInfoGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildLeaderVoteInfo;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildLeaderVoteInfo();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtNeededVotes = FlashLabel.fromNative(_nativeObject.txtNeededVotes);
         txtNeededVotesCaption = FlashLabel.fromNative(_nativeObject.txtNeededVotesCaption);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtVoteOutVotes = FlashLabel.fromNative(_nativeObject.txtVoteOutVotes);
         txtVoteOutVotesCaption = FlashLabel.fromNative(_nativeObject.txtVoteOutVotesCaption);
         txtKeepVotes = FlashLabel.fromNative(_nativeObject.txtKeepVotes);
         txtKeepVotesCaption = FlashLabel.fromNative(_nativeObject.txtKeepVotesCaption);
         txtEndTime = FlashLabel.fromNative(_nativeObject.txtEndTime);
         txtEndTimeCaption = FlashLabel.fromNative(_nativeObject.txtEndTimeCaption);
         txtInfoBottom = FlashLabelArea.fromNative(_nativeObject.txtInfoBottom);
         btnVoteOut = new SymbolUiButtonDefaultGeneric(_nativeObject.btnVoteOut);
         btnKeep = new SymbolUiButtonDefaultGeneric(_nativeObject.btnKeep);
         btnLater = new SymbolUiButtonDefaultGeneric(_nativeObject.btnLater);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildLeaderVoteInfo) : void
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
         FlashLabel.setNativeInstance(txtNeededVotes,_nativeObject.txtNeededVotes);
         FlashLabel.setNativeInstance(txtNeededVotesCaption,_nativeObject.txtNeededVotesCaption);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtVoteOutVotes,_nativeObject.txtVoteOutVotes);
         FlashLabel.setNativeInstance(txtVoteOutVotesCaption,_nativeObject.txtVoteOutVotesCaption);
         FlashLabel.setNativeInstance(txtKeepVotes,_nativeObject.txtKeepVotes);
         FlashLabel.setNativeInstance(txtKeepVotesCaption,_nativeObject.txtKeepVotesCaption);
         FlashLabel.setNativeInstance(txtEndTime,_nativeObject.txtEndTime);
         FlashLabel.setNativeInstance(txtEndTimeCaption,_nativeObject.txtEndTimeCaption);
         FlashLabelArea.setNativeInstance(txtInfoBottom,_nativeObject.txtInfoBottom);
         if(_nativeObject.btnVoteOut)
         {
            btnVoteOut.setNativeInstance(_nativeObject.btnVoteOut);
         }
         if(_nativeObject.btnKeep)
         {
            btnKeep.setNativeInstance(_nativeObject.btnKeep);
         }
         if(_nativeObject.btnLater)
         {
            btnLater.setNativeInstance(_nativeObject.btnLater);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
