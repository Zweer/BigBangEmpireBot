package visuals.ui.dialogs
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundDialogGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.outfit.SymbolOutfitContentGeneric;
   import visuals.ui.elements.outfit.SymbolOutfitLineGeneric;
   
   public class SymbolDialogOutfitsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDialogOutfits = null;
      
      public var dialogBackground:SymbolSlice9BackgroundDialogGeneric = null;
      
      public var line1:SymbolOutfitLineGeneric = null;
      
      public var line2:SymbolOutfitLineGeneric = null;
      
      public var line3:SymbolOutfitLineGeneric = null;
      
      public var line4:SymbolOutfitLineGeneric = null;
      
      public var line5:SymbolOutfitLineGeneric = null;
      
      public var line6:SymbolOutfitLineGeneric = null;
      
      public var line7:SymbolOutfitLineGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var txtInfo:ILabel = null;
      
      public var outfitContent:SymbolOutfitContentGeneric = null;
      
      public var btnClose:SymbolButtonCloseGeneric = null;
      
      public var txtDialogTitle:ILabel = null;
      
      public function SymbolDialogOutfitsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDialogOutfits;
         }
         else
         {
            _nativeObject = new SymbolDialogOutfits();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         dialogBackground = new SymbolSlice9BackgroundDialogGeneric(_nativeObject.dialogBackground);
         line1 = new SymbolOutfitLineGeneric(_nativeObject.line1);
         line2 = new SymbolOutfitLineGeneric(_nativeObject.line2);
         line3 = new SymbolOutfitLineGeneric(_nativeObject.line3);
         line4 = new SymbolOutfitLineGeneric(_nativeObject.line4);
         line5 = new SymbolOutfitLineGeneric(_nativeObject.line5);
         line6 = new SymbolOutfitLineGeneric(_nativeObject.line6);
         line7 = new SymbolOutfitLineGeneric(_nativeObject.line7);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         txtInfo = FlashLabel.fromNative(_nativeObject.txtInfo);
         outfitContent = new SymbolOutfitContentGeneric(_nativeObject.outfitContent);
         btnClose = new SymbolButtonCloseGeneric(_nativeObject.btnClose);
         txtDialogTitle = FlashLabel.fromNative(_nativeObject.txtDialogTitle);
      }
      
      public function setNativeInstance(param1:SymbolDialogOutfits) : void
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
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.line4)
         {
            line4.setNativeInstance(_nativeObject.line4);
         }
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
         if(_nativeObject.line6)
         {
            line6.setNativeInstance(_nativeObject.line6);
         }
         if(_nativeObject.line7)
         {
            line7.setNativeInstance(_nativeObject.line7);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         FlashLabel.setNativeInstance(txtInfo,_nativeObject.txtInfo);
         if(_nativeObject.outfitContent)
         {
            outfitContent.setNativeInstance(_nativeObject.outfitContent);
         }
         if(_nativeObject.btnClose)
         {
            btnClose.setNativeInstance(_nativeObject.btnClose);
         }
         FlashLabel.setNativeInstance(txtDialogTitle,_nativeObject.txtDialogTitle);
      }
   }
}
