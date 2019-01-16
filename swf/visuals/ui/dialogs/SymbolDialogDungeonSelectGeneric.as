package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonPhotoButtonGeneric;
   
   public class SymbolDialogDungeonSelectGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDungeonSelect = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtDialogTitle:ILabelArea = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var photoDungeon1:SymbolDungeonPhotoButtonGeneric = null;
      
      public var photoDungeon2:SymbolDungeonPhotoButtonGeneric = null;
      
      public var photoDungeon3:SymbolDungeonPhotoButtonGeneric = null;
      
      public function SymbolDialogDungeonSelectGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDungeonSelect;
         }
         else
         {
            _nativeObject = new SymbolDialogDungeonSelect();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabelArea.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         photoDungeon1 = new SymbolDungeonPhotoButtonGeneric(_nativeObject.photoDungeon1);
         photoDungeon2 = new SymbolDungeonPhotoButtonGeneric(_nativeObject.photoDungeon2);
         photoDungeon3 = new SymbolDungeonPhotoButtonGeneric(_nativeObject.photoDungeon3);
      }
      
      public function setNativeInstance(param1:SymbolDialogDungeonSelect) : void
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
         if(_nativeObject.photoDungeon1)
         {
            photoDungeon1.setNativeInstance(_nativeObject.photoDungeon1);
         }
         if(_nativeObject.photoDungeon2)
         {
            photoDungeon2.setNativeInstance(_nativeObject.photoDungeon2);
         }
         if(_nativeObject.photoDungeon3)
         {
            photoDungeon3.setNativeInstance(_nativeObject.photoDungeon3);
         }
      }
   }
}
