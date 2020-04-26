package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonTabGeneric;
   import visuals.ui.elements.streaming.SymbolUiStreamingActorsGeneric;
   import visuals.ui.elements.streaming.SymbolUiStreamingSettingsGeneric;
   
   public class SymbolDialogStreamingActorsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogStreamingActors = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var actorsContent:SymbolUiStreamingActorsGeneric = null;
      
      public var settingsContent:SymbolUiStreamingSettingsGeneric = null;
      
      public var btnTabActors:SymbolButtonTabGeneric = null;
      
      public var btnTabSettings:SymbolButtonTabGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public function SymbolDialogStreamingActorsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogStreamingActors;
         }
         else
         {
            _nativeObject = new SymbolDialogStreamingActors();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         actorsContent = new SymbolUiStreamingActorsGeneric(_nativeObject.actorsContent);
         settingsContent = new SymbolUiStreamingSettingsGeneric(_nativeObject.settingsContent);
         btnTabActors = new SymbolButtonTabGeneric(_nativeObject.btnTabActors);
         btnTabSettings = new SymbolButtonTabGeneric(_nativeObject.btnTabSettings);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
      }
      
      public function setNativeInstance(param1:SymbolDialogStreamingActors) : void
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
         if(_nativeObject.actorsContent)
         {
            actorsContent.setNativeInstance(_nativeObject.actorsContent);
         }
         if(_nativeObject.settingsContent)
         {
            settingsContent.setNativeInstance(_nativeObject.settingsContent);
         }
         if(_nativeObject.btnTabActors)
         {
            btnTabActors.setNativeInstance(_nativeObject.btnTabActors);
         }
         if(_nativeObject.btnTabSettings)
         {
            btnTabSettings.setNativeInstance(_nativeObject.btnTabSettings);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
      }
   }
}
