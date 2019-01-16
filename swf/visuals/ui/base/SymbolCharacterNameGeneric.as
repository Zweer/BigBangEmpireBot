package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolCounterGeneric;
   
   public class SymbolCharacterNameGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterName = null;
      
      public var txtName:ILabelArea = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var info:SymbolCounterGeneric = null;
      
      public function SymbolCharacterNameGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterName;
         }
         else
         {
            _nativeObject = new SymbolCharacterName();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         info = new SymbolCounterGeneric(_nativeObject.info);
      }
      
      public function setNativeInstance(param1:SymbolCharacterName) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         if(_nativeObject.info)
         {
            info.setNativeInstance(_nativeObject.info);
         }
      }
   }
}
