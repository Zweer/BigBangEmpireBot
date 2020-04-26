package visuals.ui.elements.fan_foto
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   
   public class SymbolUiFanFotoPicturesGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiFanFotoPictures = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var line1:SymbolFanFotoPicturesLineGeneric = null;
      
      public var line2:SymbolFanFotoPicturesLineGeneric = null;
      
      public var line3:SymbolFanFotoPicturesLineGeneric = null;
      
      public var line4:SymbolFanFotoPicturesLineGeneric = null;
      
      public var line5:SymbolFanFotoPicturesLineGeneric = null;
      
      public var line6:SymbolFanFotoPicturesLineGeneric = null;
      
      public var line7:SymbolFanFotoPicturesLineGeneric = null;
      
      public var pictures:SymbolFanFotoPicturesContentGeneric = null;
      
      public var txtTitle:ILabel = null;
      
      public function SymbolUiFanFotoPicturesGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiFanFotoPictures;
         }
         else
         {
            _nativeObject = new SymbolUiFanFotoPictures();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         line1 = new SymbolFanFotoPicturesLineGeneric(_nativeObject.line1);
         line2 = new SymbolFanFotoPicturesLineGeneric(_nativeObject.line2);
         line3 = new SymbolFanFotoPicturesLineGeneric(_nativeObject.line3);
         line4 = new SymbolFanFotoPicturesLineGeneric(_nativeObject.line4);
         line5 = new SymbolFanFotoPicturesLineGeneric(_nativeObject.line5);
         line6 = new SymbolFanFotoPicturesLineGeneric(_nativeObject.line6);
         line7 = new SymbolFanFotoPicturesLineGeneric(_nativeObject.line7);
         pictures = new SymbolFanFotoPicturesContentGeneric(_nativeObject.pictures);
         txtTitle = FlashLabel.fromNative(_nativeObject.txtTitle);
      }
      
      public function setNativeInstance(param1:SymbolUiFanFotoPictures) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
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
         if(_nativeObject.pictures)
         {
            pictures.setNativeInstance(_nativeObject.pictures);
         }
         FlashLabel.setNativeInstance(txtTitle,_nativeObject.txtTitle);
      }
   }
}
