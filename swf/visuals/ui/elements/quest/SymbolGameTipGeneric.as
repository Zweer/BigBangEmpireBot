package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolGameTipGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGameTip = null;
      
      public var message:SymbolGameTipMessageGeneric = null;
      
      public function SymbolGameTipGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGameTip;
         }
         else
         {
            _nativeObject = new SymbolGameTip();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         message = new SymbolGameTipMessageGeneric(_nativeObject.message);
      }
      
      public function setNativeInstance(param1:SymbolGameTip) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.message)
         {
            message.setNativeInstance(_nativeObject.message);
         }
      }
   }
}
