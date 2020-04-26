package visuals.ui.elements.avatar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolAvatarDungeonNPCGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolAvatarDungeonNPC = null;
      
      public var npcImage:SymbolPlaceholderGeneric = null;
      
      public function SymbolAvatarDungeonNPCGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolAvatarDungeonNPC;
         }
         else
         {
            _nativeObject = new SymbolAvatarDungeonNPC();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         npcImage = new SymbolPlaceholderGeneric(_nativeObject.npcImage);
      }
      
      public function setNativeInstance(param1:SymbolAvatarDungeonNPC) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.npcImage)
         {
            npcImage.setNativeInstance(_nativeObject.npcImage);
         }
      }
   }
}
