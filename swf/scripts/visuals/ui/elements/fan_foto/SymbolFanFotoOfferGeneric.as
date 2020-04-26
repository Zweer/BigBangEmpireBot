package visuals.ui.elements.fan_foto
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
   
   public class SymbolFanFotoOfferGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolFanFotoOffer = null;
      
      public var offer1:SymbolIconFanFotoOffer1Generic = null;
      
      public var offer2:SymbolIconFanFotoOffer2Generic = null;
      
      public var offer3:SymbolIconFanFotoOffer3Generic = null;
      
      public var symbolIconFanFotoResource:SymbolIconFanFotoResourceGeneric = null;
      
      public var txtResource:ILabel = null;
      
      public var txtName:ILabelArea = null;
      
      public var btnUnlockFoto:SymbolUiButtonDefaultGeneric = null;
      
      public function SymbolFanFotoOfferGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolFanFotoOffer;
         }
         else
         {
            _nativeObject = new SymbolFanFotoOffer();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         offer1 = new SymbolIconFanFotoOffer1Generic(_nativeObject.offer1);
         offer2 = new SymbolIconFanFotoOffer2Generic(_nativeObject.offer2);
         offer3 = new SymbolIconFanFotoOffer3Generic(_nativeObject.offer3);
         symbolIconFanFotoResource = new SymbolIconFanFotoResourceGeneric(_nativeObject.symbolIconFanFotoResource);
         txtResource = FlashLabel.fromNative(_nativeObject.txtResource);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         btnUnlockFoto = new SymbolUiButtonDefaultGeneric(_nativeObject.btnUnlockFoto);
      }
      
      public function setNativeInstance(param1:SymbolFanFotoOffer) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.offer1)
         {
            offer1.setNativeInstance(_nativeObject.offer1);
         }
         if(_nativeObject.offer2)
         {
            offer2.setNativeInstance(_nativeObject.offer2);
         }
         if(_nativeObject.offer3)
         {
            offer3.setNativeInstance(_nativeObject.offer3);
         }
         if(_nativeObject.symbolIconFanFotoResource)
         {
            symbolIconFanFotoResource.setNativeInstance(_nativeObject.symbolIconFanFotoResource);
         }
         FlashLabel.setNativeInstance(txtResource,_nativeObject.txtResource);
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.btnUnlockFoto)
         {
            btnUnlockFoto.setNativeInstance(_nativeObject.btnUnlockFoto);
         }
      }
   }
}
