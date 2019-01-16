package visuals.ui.elements.character_selection
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolCharacterSelectionAddGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterSelectionAdd = null;
      
      public var txtName:ILabelArea = null;
      
      public function SymbolCharacterSelectionAddGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterSelectionAdd;
         }
         else
         {
            _nativeObject = new SymbolCharacterSelectionAdd();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
      }
      
      public function setNativeInstance(param1:SymbolCharacterSelectionAdd) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
      }
   }
}
