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
   import visuals.ui.elements.dungeon.SymbolDungeonPhotoBigGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonStatusLevelLineGeneric;
   
   public class SymbolDialogDungeonStatusGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDungeonStatus = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtLevelsCaption:ILabel = null;
      
      public var photo:SymbolDungeonPhotoBigGeneric = null;
      
      public var level1:SymbolDungeonStatusLevelLineGeneric = null;
      
      public var level2:SymbolDungeonStatusLevelLineGeneric = null;
      
      public var level3:SymbolDungeonStatusLevelLineGeneric = null;
      
      public function SymbolDialogDungeonStatusGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDungeonStatus;
         }
         else
         {
            _nativeObject = new SymbolDialogDungeonStatus();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtLevelsCaption = FlashLabel.fromNative(_nativeObject.txtLevelsCaption);
         photo = new SymbolDungeonPhotoBigGeneric(_nativeObject.photo);
         level1 = new SymbolDungeonStatusLevelLineGeneric(_nativeObject.level1);
         level2 = new SymbolDungeonStatusLevelLineGeneric(_nativeObject.level2);
         level3 = new SymbolDungeonStatusLevelLineGeneric(_nativeObject.level3);
      }
      
      public function setNativeInstance(param1:SymbolDialogDungeonStatus) : void
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
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabelArea.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtLevelsCaption,_nativeObject.txtLevelsCaption);
         if(_nativeObject.photo)
         {
            photo.setNativeInstance(_nativeObject.photo);
         }
         if(_nativeObject.level1)
         {
            level1.setNativeInstance(_nativeObject.level1);
         }
         if(_nativeObject.level2)
         {
            level2.setNativeInstance(_nativeObject.level2);
         }
         if(_nativeObject.level3)
         {
            level3.setNativeInstance(_nativeObject.level3);
         }
      }
   }
}
