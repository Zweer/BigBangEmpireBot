package visuals.ui.elements.dating
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
   
   public class SymbolButtonDatingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonDating = null;
      
      public var bg:SymbolButtonConventionPlateGeneric = null;
      
      public var txtTimer:ILabel = null;
      
      public var progress:SymbolDatingBarSmallGeneric = null;
      
      public var questGraphic:SymbolDatingGraphicGeneric = null;
      
      public var iconLock:SymbolIconLockBigGeneric = null;
      
      public var txtProgress:ILabelArea = null;
      
      public var exclamationMark:SymbolExclamationMarkQuestStarGeneric = null;
      
      public var balloon:SymbolDatingDialogMessageBubbleSmallGeneric = null;
      
      public var tooltipLayer:SymbolDummyGeneric = null;
      
      public function SymbolButtonDatingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonDating;
         }
         else
         {
            _nativeObject = new SymbolButtonDating();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolButtonConventionPlateGeneric(_nativeObject.bg);
         txtTimer = FlashLabel.fromNative(_nativeObject.txtTimer);
         progress = new SymbolDatingBarSmallGeneric(_nativeObject.progress);
         questGraphic = new SymbolDatingGraphicGeneric(_nativeObject.questGraphic);
         iconLock = new SymbolIconLockBigGeneric(_nativeObject.iconLock);
         txtProgress = FlashLabelArea.fromNative(_nativeObject.txtProgress);
         exclamationMark = new SymbolExclamationMarkQuestStarGeneric(_nativeObject.exclamationMark);
         balloon = new SymbolDatingDialogMessageBubbleSmallGeneric(_nativeObject.balloon);
         tooltipLayer = new SymbolDummyGeneric(_nativeObject.tooltipLayer);
      }
      
      public function setNativeInstance(param1:SymbolButtonDating) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         FlashLabel.setNativeInstance(txtTimer,_nativeObject.txtTimer);
         if(_nativeObject.progress)
         {
            progress.setNativeInstance(_nativeObject.progress);
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
         if(_nativeObject.balloon)
         {
            balloon.setNativeInstance(_nativeObject.balloon);
         }
         if(_nativeObject.tooltipLayer)
         {
            tooltipLayer.setNativeInstance(_nativeObject.tooltipLayer);
         }
      }
   }
}
