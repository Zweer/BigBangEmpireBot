package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.guild.SymbolGuildEmblemContentGeneric;
   
   public class SymbolDialogGuildEmblemGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogGuildEmblem = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var emblemContent:SymbolGuildEmblemContentGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public function SymbolDialogGuildEmblemGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogGuildEmblem;
         }
         else
         {
            _nativeObject = new SymbolDialogGuildEmblem();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         emblemContent = new SymbolGuildEmblemContentGeneric(_nativeObject.emblemContent);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
      }
      
      public function setNativeInstance(param1:SymbolDialogGuildEmblem) : void
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
         if(_nativeObject.emblemContent)
         {
            emblemContent.setNativeInstance(_nativeObject.emblemContent);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
      }
   }
}
