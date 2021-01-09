package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolStudioCustomizationNewBubbleGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStudioCustomizationNewBubble = null;
      
      public var txt:ILabel = null;
      
      public function SymbolStudioCustomizationNewBubbleGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStudioCustomizationNewBubble;
         }
         else
         {
            _nativeObject = new SymbolStudioCustomizationNewBubble();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txt = FlashLabel.fromNative(_nativeObject.txt);
      }
      
      public function setNativeInstance(param1:SymbolStudioCustomizationNewBubble) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txt,_nativeObject.txt);
      }
   }
}
