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
   import visuals.ui.elements.generic.SymbolUiSliderQualityGeneric;
   
   public class SymbolDialogGameSettingsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGameSettings = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtHighAnimationQuality:ILabelArea = null;
      
      public var checkShowItemPattern:SymbolUiCheckboxGeneric = null;
      
      public var txtShowItemPattern:ILabelArea = null;
      
      public var checkShowStorygoals:SymbolUiCheckboxGeneric = null;
      
      public var txtShowStorygoals:ILabelArea = null;
      
      public var txtShowShopPreview:ILabelArea = null;
      
      public var checkShowShopPreview:SymbolUiCheckboxGeneric = null;
      
      public var txtShowFriendbar:ILabelArea = null;
      
      public var checkShowFriendbar:SymbolUiCheckboxGeneric = null;
      
      public var txtShowGuildBattles:ILabelArea = null;
      
      public var checkShowGuildBattles:SymbolUiCheckboxGeneric = null;
      
      public var checkShowStoryDungeonBattles:SymbolUiCheckboxGeneric = null;
      
      public var txtShowStoryDungeonBattles:ILabelArea = null;
      
      public var checkShowDuelBattles:SymbolUiCheckboxGeneric = null;
      
      public var txtShowDuelBattles:ILabelArea = null;
      
      public var txtShowFightMissionBattles:ILabelArea = null;
      
      public var checkShowFightMissionBattles:SymbolUiCheckboxGeneric = null;
      
      public var txtShowDungeonBattles:ILabelArea = null;
      
      public var checkShowDungeonBattles:SymbolUiCheckboxGeneric = null;
      
      public var txtShowMovieBattles:ILabelArea = null;
      
      public var checkShowMovieBattles:SymbolUiCheckboxGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var sldQuality:SymbolUiSliderQualityGeneric = null;
      
      public function SymbolDialogGameSettingsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGameSettings;
         }
         else
         {
            _nativeObject = new SymbolDialogGameSettings();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtHighAnimationQuality = FlashLabelArea.fromNative(_nativeObject.txtHighAnimationQuality);
         checkShowItemPattern = new SymbolUiCheckboxGeneric(_nativeObject.checkShowItemPattern);
         txtShowItemPattern = FlashLabelArea.fromNative(_nativeObject.txtShowItemPattern);
         checkShowStorygoals = new SymbolUiCheckboxGeneric(_nativeObject.checkShowStorygoals);
         txtShowStorygoals = FlashLabelArea.fromNative(_nativeObject.txtShowStorygoals);
         txtShowShopPreview = FlashLabelArea.fromNative(_nativeObject.txtShowShopPreview);
         checkShowShopPreview = new SymbolUiCheckboxGeneric(_nativeObject.checkShowShopPreview);
         txtShowFriendbar = FlashLabelArea.fromNative(_nativeObject.txtShowFriendbar);
         checkShowFriendbar = new SymbolUiCheckboxGeneric(_nativeObject.checkShowFriendbar);
         txtShowGuildBattles = FlashLabelArea.fromNative(_nativeObject.txtShowGuildBattles);
         checkShowGuildBattles = new SymbolUiCheckboxGeneric(_nativeObject.checkShowGuildBattles);
         checkShowStoryDungeonBattles = new SymbolUiCheckboxGeneric(_nativeObject.checkShowStoryDungeonBattles);
         txtShowStoryDungeonBattles = FlashLabelArea.fromNative(_nativeObject.txtShowStoryDungeonBattles);
         checkShowDuelBattles = new SymbolUiCheckboxGeneric(_nativeObject.checkShowDuelBattles);
         txtShowDuelBattles = FlashLabelArea.fromNative(_nativeObject.txtShowDuelBattles);
         txtShowFightMissionBattles = FlashLabelArea.fromNative(_nativeObject.txtShowFightMissionBattles);
         checkShowFightMissionBattles = new SymbolUiCheckboxGeneric(_nativeObject.checkShowFightMissionBattles);
         txtShowDungeonBattles = FlashLabelArea.fromNative(_nativeObject.txtShowDungeonBattles);
         checkShowDungeonBattles = new SymbolUiCheckboxGeneric(_nativeObject.checkShowDungeonBattles);
         txtShowMovieBattles = FlashLabelArea.fromNative(_nativeObject.txtShowMovieBattles);
         checkShowMovieBattles = new SymbolUiCheckboxGeneric(_nativeObject.checkShowMovieBattles);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         sldQuality = new SymbolUiSliderQualityGeneric(_nativeObject.sldQuality);
      }
      
      public function setNativeInstance(param1:SymbolDialogGameSettings) : void
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
         FlashLabelArea.setNativeInstance(txtHighAnimationQuality,_nativeObject.txtHighAnimationQuality);
         if(_nativeObject.checkShowItemPattern)
         {
            checkShowItemPattern.setNativeInstance(_nativeObject.checkShowItemPattern);
         }
         FlashLabelArea.setNativeInstance(txtShowItemPattern,_nativeObject.txtShowItemPattern);
         if(_nativeObject.checkShowStorygoals)
         {
            checkShowStorygoals.setNativeInstance(_nativeObject.checkShowStorygoals);
         }
         FlashLabelArea.setNativeInstance(txtShowStorygoals,_nativeObject.txtShowStorygoals);
         FlashLabelArea.setNativeInstance(txtShowShopPreview,_nativeObject.txtShowShopPreview);
         if(_nativeObject.checkShowShopPreview)
         {
            checkShowShopPreview.setNativeInstance(_nativeObject.checkShowShopPreview);
         }
         FlashLabelArea.setNativeInstance(txtShowFriendbar,_nativeObject.txtShowFriendbar);
         if(_nativeObject.checkShowFriendbar)
         {
            checkShowFriendbar.setNativeInstance(_nativeObject.checkShowFriendbar);
         }
         FlashLabelArea.setNativeInstance(txtShowGuildBattles,_nativeObject.txtShowGuildBattles);
         if(_nativeObject.checkShowGuildBattles)
         {
            checkShowGuildBattles.setNativeInstance(_nativeObject.checkShowGuildBattles);
         }
         if(_nativeObject.checkShowStoryDungeonBattles)
         {
            checkShowStoryDungeonBattles.setNativeInstance(_nativeObject.checkShowStoryDungeonBattles);
         }
         FlashLabelArea.setNativeInstance(txtShowStoryDungeonBattles,_nativeObject.txtShowStoryDungeonBattles);
         if(_nativeObject.checkShowDuelBattles)
         {
            checkShowDuelBattles.setNativeInstance(_nativeObject.checkShowDuelBattles);
         }
         FlashLabelArea.setNativeInstance(txtShowDuelBattles,_nativeObject.txtShowDuelBattles);
         FlashLabelArea.setNativeInstance(txtShowFightMissionBattles,_nativeObject.txtShowFightMissionBattles);
         if(_nativeObject.checkShowFightMissionBattles)
         {
            checkShowFightMissionBattles.setNativeInstance(_nativeObject.checkShowFightMissionBattles);
         }
         FlashLabelArea.setNativeInstance(txtShowDungeonBattles,_nativeObject.txtShowDungeonBattles);
         if(_nativeObject.checkShowDungeonBattles)
         {
            checkShowDungeonBattles.setNativeInstance(_nativeObject.checkShowDungeonBattles);
         }
         FlashLabelArea.setNativeInstance(txtShowMovieBattles,_nativeObject.txtShowMovieBattles);
         if(_nativeObject.checkShowMovieBattles)
         {
            checkShowMovieBattles.setNativeInstance(_nativeObject.checkShowMovieBattles);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         if(_nativeObject.sldQuality)
         {
            sldQuality.setNativeInstance(_nativeObject.sldQuality);
         }
      }
   }
}
