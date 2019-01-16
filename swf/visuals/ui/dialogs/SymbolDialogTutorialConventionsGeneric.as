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
   import visuals.ui.elements.conventions.SymbolConventionFansBarGeneric;
   import visuals.ui.elements.tutorial.SymbolLadyBackGeneric;
   
   public class SymbolDialogTutorialConventionsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogTutorialConventions = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var btnClose:SymbolUiButtonDefaultGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public var txtMessage:ILabelArea = null;
      
      public var txtFans:ILabel = null;
      
      public var txtVisitors:ILabel = null;
      
      public var progress:SymbolConventionFansBarGeneric = null;
      
      public var lady:SymbolLadyBackGeneric = null;
      
      public function SymbolDialogTutorialConventionsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogTutorialConventions;
         }
         else
         {
            _nativeObject = new SymbolDialogTutorialConventions();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         btnClose = new SymbolUiButtonDefaultGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
         txtMessage = FlashLabelArea.fromNative(_nativeObject.txtMessage);
         txtFans = FlashLabel.fromNative(_nativeObject.txtFans);
         txtVisitors = FlashLabel.fromNative(_nativeObject.txtVisitors);
         progress = new SymbolConventionFansBarGeneric(_nativeObject.progress);
         lady = new SymbolLadyBackGeneric(_nativeObject.lady);
      }
      
      public function setNativeInstance(param1:SymbolDialogTutorialConventions) : void
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
         FlashLabelArea.setNativeInstance(txtMessage,_nativeObject.txtMessage);
         FlashLabel.setNativeInstance(txtFans,_nativeObject.txtFans);
         FlashLabel.setNativeInstance(txtVisitors,_nativeObject.txtVisitors);
         if(_nativeObject.progress)
         {
            progress.setNativeInstance(_nativeObject.progress);
         }
         if(_nativeObject.lady)
         {
            lady.setNativeInstance(_nativeObject.lady);
         }
      }
   }
}
