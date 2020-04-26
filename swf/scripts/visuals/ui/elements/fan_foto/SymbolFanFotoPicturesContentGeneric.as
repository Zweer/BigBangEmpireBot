package visuals.ui.elements.fan_foto
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   
   public class SymbolFanFotoPicturesContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolFanFotoPicturesContent = null;
      
      public var txtPages:ILabelArea = null;
      
      public var btnRight:SymbolButtonArrowRightGeneric = null;
      
      public var btnLeft:SymbolButtonArrowLeftGeneric = null;
      
      public var picture1:SymbolFanFotoPictureGeneric = null;
      
      public var picture2:SymbolFanFotoPictureGeneric = null;
      
      public var picture3:SymbolFanFotoPictureGeneric = null;
      
      public var picture4:SymbolFanFotoPictureGeneric = null;
      
      public var picture5:SymbolFanFotoPictureGeneric = null;
      
      public var picture6:SymbolFanFotoPictureGeneric = null;
      
      public var picture7:SymbolFanFotoPictureGeneric = null;
      
      public var picture8:SymbolFanFotoPictureGeneric = null;
      
      public var picture9:SymbolFanFotoPictureGeneric = null;
      
      public var picture10:SymbolFanFotoPictureGeneric = null;
      
      public var picture11:SymbolFanFotoPictureGeneric = null;
      
      public var picture12:SymbolFanFotoPictureGeneric = null;
      
      public function SymbolFanFotoPicturesContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolFanFotoPicturesContent;
         }
         else
         {
            _nativeObject = new SymbolFanFotoPicturesContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtPages = FlashLabelArea.fromNative(_nativeObject.txtPages);
         btnRight = new SymbolButtonArrowRightGeneric(_nativeObject.btnRight);
         btnLeft = new SymbolButtonArrowLeftGeneric(_nativeObject.btnLeft);
         picture1 = new SymbolFanFotoPictureGeneric(_nativeObject.picture1);
         picture2 = new SymbolFanFotoPictureGeneric(_nativeObject.picture2);
         picture3 = new SymbolFanFotoPictureGeneric(_nativeObject.picture3);
         picture4 = new SymbolFanFotoPictureGeneric(_nativeObject.picture4);
         picture5 = new SymbolFanFotoPictureGeneric(_nativeObject.picture5);
         picture6 = new SymbolFanFotoPictureGeneric(_nativeObject.picture6);
         picture7 = new SymbolFanFotoPictureGeneric(_nativeObject.picture7);
         picture8 = new SymbolFanFotoPictureGeneric(_nativeObject.picture8);
         picture9 = new SymbolFanFotoPictureGeneric(_nativeObject.picture9);
         picture10 = new SymbolFanFotoPictureGeneric(_nativeObject.picture10);
         picture11 = new SymbolFanFotoPictureGeneric(_nativeObject.picture11);
         picture12 = new SymbolFanFotoPictureGeneric(_nativeObject.picture12);
      }
      
      public function setNativeInstance(param1:SymbolFanFotoPicturesContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtPages,_nativeObject.txtPages);
         if(_nativeObject.btnRight)
         {
            btnRight.setNativeInstance(_nativeObject.btnRight);
         }
         if(_nativeObject.btnLeft)
         {
            btnLeft.setNativeInstance(_nativeObject.btnLeft);
         }
         if(_nativeObject.picture1)
         {
            picture1.setNativeInstance(_nativeObject.picture1);
         }
         if(_nativeObject.picture2)
         {
            picture2.setNativeInstance(_nativeObject.picture2);
         }
         if(_nativeObject.picture3)
         {
            picture3.setNativeInstance(_nativeObject.picture3);
         }
         if(_nativeObject.picture4)
         {
            picture4.setNativeInstance(_nativeObject.picture4);
         }
         if(_nativeObject.picture5)
         {
            picture5.setNativeInstance(_nativeObject.picture5);
         }
         if(_nativeObject.picture6)
         {
            picture6.setNativeInstance(_nativeObject.picture6);
         }
         if(_nativeObject.picture7)
         {
            picture7.setNativeInstance(_nativeObject.picture7);
         }
         if(_nativeObject.picture8)
         {
            picture8.setNativeInstance(_nativeObject.picture8);
         }
         if(_nativeObject.picture9)
         {
            picture9.setNativeInstance(_nativeObject.picture9);
         }
         if(_nativeObject.picture10)
         {
            picture10.setNativeInstance(_nativeObject.picture10);
         }
         if(_nativeObject.picture11)
         {
            picture11.setNativeInstance(_nativeObject.picture11);
         }
         if(_nativeObject.picture12)
         {
            picture12.setNativeInstance(_nativeObject.picture12);
         }
      }
   }
}
