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
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   
   public class SymbolDialogDungeonOutroGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogDungeonOutro = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtInfo:ILabelArea = null;
      
      public var txtFinished:ILabel = null;
      
      public var txtTimeUp:ILabel = null;
      
      public var photoLevel1:SymbolDungeonPhotoBigGeneric = null;
      
      public var photoLevel2:SymbolDungeonPhotoBigGeneric = null;
      
      public var photoLevel3:SymbolDungeonPhotoBigGeneric = null;
      
      public var txtDoneLevel1:ILabelArea = null;
      
      public var txtDoneLevel2:ILabelArea = null;
      
      public var txtDoneLevel3:ILabelArea = null;
      
      public var iconCheckmarkLevel1:SymbolIconCheckmarkGeneric = null;
      
      public var iconCheckmarkLevel2:SymbolIconCheckmarkGeneric = null;
      
      public var iconCheckmarkLevel3:SymbolIconCheckmarkGeneric = null;
      
      public function SymbolDialogDungeonOutroGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogDungeonOutro;
         }
         else
         {
            _nativeObject = new SymbolDialogDungeonOutro();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
         txtFinished = FlashLabel.fromNative(_nativeObject.txtFinished);
         txtTimeUp = FlashLabel.fromNative(_nativeObject.txtTimeUp);
         photoLevel1 = new SymbolDungeonPhotoBigGeneric(_nativeObject.photoLevel1);
         photoLevel2 = new SymbolDungeonPhotoBigGeneric(_nativeObject.photoLevel2);
         photoLevel3 = new SymbolDungeonPhotoBigGeneric(_nativeObject.photoLevel3);
         txtDoneLevel1 = FlashLabelArea.fromNative(_nativeObject.txtDoneLevel1);
         txtDoneLevel2 = FlashLabelArea.fromNative(_nativeObject.txtDoneLevel2);
         txtDoneLevel3 = FlashLabelArea.fromNative(_nativeObject.txtDoneLevel3);
         iconCheckmarkLevel1 = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmarkLevel1);
         iconCheckmarkLevel2 = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmarkLevel2);
         iconCheckmarkLevel3 = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmarkLevel3);
      }
      
      public function setNativeInstance(param1:SymbolDialogDungeonOutro) : void
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
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         FlashLabel.setNativeInstance(txtFinished,_nativeObject.txtFinished);
         FlashLabel.setNativeInstance(txtTimeUp,_nativeObject.txtTimeUp);
         if(_nativeObject.photoLevel1)
         {
            photoLevel1.setNativeInstance(_nativeObject.photoLevel1);
         }
         if(_nativeObject.photoLevel2)
         {
            photoLevel2.setNativeInstance(_nativeObject.photoLevel2);
         }
         if(_nativeObject.photoLevel3)
         {
            photoLevel3.setNativeInstance(_nativeObject.photoLevel3);
         }
         FlashLabelArea.setNativeInstance(txtDoneLevel1,_nativeObject.txtDoneLevel1);
         FlashLabelArea.setNativeInstance(txtDoneLevel2,_nativeObject.txtDoneLevel2);
         FlashLabelArea.setNativeInstance(txtDoneLevel3,_nativeObject.txtDoneLevel3);
         if(_nativeObject.iconCheckmarkLevel1)
         {
            iconCheckmarkLevel1.setNativeInstance(_nativeObject.iconCheckmarkLevel1);
         }
         if(_nativeObject.iconCheckmarkLevel2)
         {
            iconCheckmarkLevel2.setNativeInstance(_nativeObject.iconCheckmarkLevel2);
         }
         if(_nativeObject.iconCheckmarkLevel3)
         {
            iconCheckmarkLevel3.setNativeInstance(_nativeObject.iconCheckmarkLevel3);
         }
      }
   }
}
