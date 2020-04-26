package visuals.ui.elements.story_dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolExclamationMarkQuestStarGeneric;
   import visuals.ui.elements.conventions.SymbolButtonConventionPlateGeneric;
   import visuals.ui.elements.icons.SymbolIconLockBigGeneric;
   
   public class SymbolButtonStoryDungeonGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonStoryDungeon = null;
      
      public var timerBg:SymbolButtonConventionPlateGeneric = null;
      
      public var txtTimer:ILabel = null;
      
      public var progressBar:SymbolStoryDungeonProgressBarGeneric = null;
      
      public var questGraphic:SymbolStoryDungeonGraphicGeneric = null;
      
      public var iconLock:SymbolIconLockBigGeneric = null;
      
      public var txtProgress:ILabelArea = null;
      
      public var exclamationMark:SymbolExclamationMarkQuestStarGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolButtonStoryDungeonGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonStoryDungeon;
         }
         else
         {
            _nativeObject = new SymbolButtonStoryDungeon();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         timerBg = new SymbolButtonConventionPlateGeneric(_nativeObject.timerBg);
         txtTimer = FlashLabel.fromNative(_nativeObject.txtTimer);
         progressBar = new SymbolStoryDungeonProgressBarGeneric(_nativeObject.progressBar);
         questGraphic = new SymbolStoryDungeonGraphicGeneric(_nativeObject.questGraphic);
         iconLock = new SymbolIconLockBigGeneric(_nativeObject.iconLock);
         txtProgress = FlashLabelArea.fromNative(_nativeObject.txtProgress);
         exclamationMark = new SymbolExclamationMarkQuestStarGeneric(_nativeObject.exclamationMark);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolButtonStoryDungeon) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.timerBg)
         {
            timerBg.setNativeInstance(_nativeObject.timerBg);
         }
         FlashLabel.setNativeInstance(txtTimer,_nativeObject.txtTimer);
         if(_nativeObject.progressBar)
         {
            progressBar.setNativeInstance(_nativeObject.progressBar);
         }
         if(_nativeObject.questGraphic)
         {
            questGraphic.setNativeInstance(_nativeObject.questGraphic);
         }
         if(_nativeObject.iconLock)
         {
            iconLock.setNativeInstance(_nativeObject.iconLock);
         }
         FlashLabelArea.setNativeInstance(txtProgress,_nativeObject.txtProgress);
         if(_nativeObject.exclamationMark)
         {
            exclamationMark.setNativeInstance(_nativeObject.exclamationMark);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}
